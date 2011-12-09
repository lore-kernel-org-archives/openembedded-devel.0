Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1RZ5sV-00068T-N1
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 20:13:03 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id C0753F8124F; Fri,  9 Dec 2011 12:06:11 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 61FD2F81245;
	Fri,  9 Dec 2011 12:06:10 -0700 (MST)
Message-ID: <4EE25C22.5030605@mlbassoc.com>
Date: Fri, 09 Dec 2011 12:06:10 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4EE17931.7000609@googlemail.com>	<CABcZANn76DwH5QPkZw_zPVBHxS0F3a-7YgKebU3Hd=+CtZd+eQ@mail.gmail.com>	<4EE20646.2030300@googlemail.com>	<jbt2rc$l31$1@dough.gmane.org>
	<4EE2305B.5030407@googlemail.com> <4EE23411.2060907@windriver.com>
	<4EE25A0B.7070309@googlemail.com>
In-Reply-To: <4EE25A0B.7070309@googlemail.com>
Subject: Re: packages versioning
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
X-List-Received-Date: Fri, 09 Dec 2011 19:13:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-12-09 11:57, Mr Dash Four wrote:
>
>> The creation of the filesystem image is driven by a number of components. Basically it works like this:
> Thanks a lot for that - a good insight into the workings of oe and bitbake. I was hoping there would be an easier way to configure/change this to what I want, but I see that it is
> much more complex than I thought initially.
>
>> I have a spreadsheet (OpenOffice 17k, or Excel 81k) that lists all of the current breakdowns. If you are interested send me an email off list.
> I am interested (excel would be nice, thanks), but don't know your email address (all I get when responding to 'all' is the mailing list email address) - if you know mine, you
> could send me that and I'll have a look.
>
> I take it there isn't an easy way to see the hierarchy of all packages/dependencies involved in a particular image, is it (your spreadsheet may be good, but I suppose it is static
> and reflects just a current snapshot of a given packages/dependencies and that might change)?
>
> If all else fails, I might use ipkg on the target system to uninstall the packages I don't need and install new ones - not ideal by any means, but this is what I'll do only as a
> last resort, if all else fails. Thanks again for the thorough response!

You can also use 'bitbake -u hob' which will let you interactively
build and modify images.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


