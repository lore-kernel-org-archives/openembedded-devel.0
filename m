Received: from exprod5og107.obsmtp.com ([64.18.0.184])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1P8sEr-0002PR-Tn
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 12:19:17 +0200
Received: from source ([4.78.218.129]) (using TLSv1) by
	exprod5ob107.postini.com ([64.18.4.12]) with SMTP
	ID DSNKTMATd0xHdc1ZAkWEoEsjAt+7E2xNpYBh@postini.com;
	Thu, 21 Oct 2010 03:18:39 PDT
Received: from unknown (HELO cinmlef12.e2k.ad.ge.com) ([3.159.213.59])
	by Cinmlip08.e2k.ad.ge.com with ESMTP; 21 Oct 2010 05:31:51 -0400
Received: from [3.138.54.92] ([3.138.54.92]) by cinmlef12.e2k.ad.ge.com with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 21 Oct 2010 05:31:50 -0400
Message-ID: <4CC0083A.1050409@ge.com>
Date: Thu, 21 Oct 2010 10:30:34 +0100
From: Martyn Welch <martyn.welch@ge.com>
Organization: GE Intelligent Platforms
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.14) Gecko/20101006 Thunderbird/3.0.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20101020203828.GU11514@denix.org>
In-Reply-To: <20101020203828.GU11514@denix.org>
X-Enigmail-Version: 1.0.1
X-OriginalArrivalTime: 21 Oct 2010 09:31:50.0710 (UTC)
	FILETIME=[CA3D9D60:01CB7102]
X-SA-Exim-Connect-IP: 64.18.0.184
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: LICENSE field format
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Oct 2010 10:19:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 20/10/10 21:38, Denys Dmytriyenko wrote:
> All,
> 
> We've had a number of discussions on the license matter recently. Trying to 
> unify those brings us to the question of the LICENSE field format in recipes. 
> As some projects are dual/triple licensed or use multiple licenses at the same 
> time, it becomes hard to specify it all in the LICENSE field, especially when 
> there are no rules defined. We do have several different formats used to 
> separate multiple licenses, which is quite confusing and doesn't make it clear 
> whether licenses are AND-ed or OR-ed (I know those are not legal terms, but 
> for the purpose of this discussion that's fine :)) Here are some examples:
> 
> LICENSE = "License1 License2"
> LICENSE = "License1|License2"
> LICENSE = "License1, License2"
> LICENSE = "License1+License2"
> LICENSE = "License1/License2"
> 
> LICENSE = "Very Long License Name"
> LICENSE = "License with some exceptions"
> 
> To make matters worse, src_distribute.bbclass splits the field at spaces and 
> creates directories for each token. So, for the last two examples above, we 
> end up with 4 directories for every license - each word is a separate 
> directory...
> 
> I'd like to raise this issue and start a discussion on unifying the LICENSE 
> field format (and fixing src_distribute.bbclass accordingly). Would be nice to 
> collect some ideas here on the maillist and/or discuss it further during OEDEM 
> next week. Please feel free to comment.
> 

I think we can probably break this problem down into two parts:

1) Unifying the strings used to specify commonly used licenses, whilst
still providing enough flexibility to enter less common licenses.

2) Reliably itemizing a list of licenses, given 1)

Having spent some time recently working with python and knowing that
bitbake is essentially a python application, I can see how this has
shaped the bb recipe syntax. This to me suggests that part one may be
efficiently solved by allowing the LICENSE field to be either a string
or list (following python syntax). Therefore:

LICENSE = "License1"

or for recipes with multiple licenses:

LICENSE = ["License1", "Lisense2"]

As this separates each license into it's own string, it becomes easier
to parse the licenses as we no longer need to define extra special
characters to separate licenses.

I do feel that creating a set of standardised strings that can be used
to differentiate between common licenses (with a common approach to
specify versions and other modifciations) makes sense, there has already
seems to have been some consensus on the list about a format for at
least the GPL. Anything that is not recognized as a standardised string
can be considered as a non-standard license (or at least one that hasn't
yet been provided with a standardised form).

I think we should proceed as follows:

* The TSC need to decide first whether a mandated structure for the
license field is to be used in the future and to specify somewhere (such
as a location on the wiki) where this mandated structure will be formulated.

* Assuming that it is decided that this is required, anyone who is
interested can add their ideas there - even if it ends up as a wiki page
with multiple competing specifications.

* The TSC should then be called upon to make the a decision in relation
to the specifications laid out, with the option for more time to be
spent working on a merged specification, etc, which can then be looked
at again at a later date.

Martyn

-- 
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square,
Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189


