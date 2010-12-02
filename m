Received: from 173-11-172-146-houston.txt.hfc.comcastbusiness.net
	([173.11.172.146] helo=mail.breakawaysystems.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dave@lambsys.com>) id 1POFvT-0007QR-Gt
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Dec 2010 21:38:48 +0100
Received: by mail.breakawaysystems.com (Postfix, from userid 1007)
	id 4DCF91489E2; Thu,  2 Dec 2010 14:37:25 -0600 (CST)
Received: from [192.168.1.100]
	(173-11.172.145-houston.txt.hfc.comcastbusiness.net [173.11.172.145])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: dlambert)
	by mail.breakawaysystems.com (Postfix) with ESMTPSA id 89BDB1489DE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Dec 2010 14:37:23 -0600 (CST)
Message-ID: <4CF80383.6010401@lambsys.com>
Date: Thu, 02 Dec 2010 14:37:23 -0600
From: David Lambert <dave@lambsys.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CF68D24.80900@lambsys.com>	<20101201180621.GB20482@excalibur.local>	<4CF69653.5000504@lambsys.com>	<20101201185406.GC20482@excalibur.local>
	<AANLkTins+XE2Zq2P=wBHUc9N9XvD0f+t7zdyVjNevggS@mail.gmail.com>
In-Reply-To: <AANLkTins+XE2Zq2P=wBHUc9N9XvD0f+t7zdyVjNevggS@mail.gmail.com>
X-SA-Exim-Connect-IP: 173.11.172.146
X-SA-Exim-Mail-From: dave@lambsys.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Documentation
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
X-List-Received-Date: Thu, 02 Dec 2010 20:38:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for all the suggestions. While on the subject, does a dictionary 
of keywords with their meanings exist anywhere? Newbies like me may find 
it very useful when browsing recipes. Some terms are intuitively 
obvious, such as DEV_BASE, but others such as PR, INHERIT, PV, leave me 
with some ambiguity.

Regards,

Dave.


On 12/01/2010 04:46 PM, Robert Foerster wrote:
> On Wed, Dec 1, 2010 at 1:54 PM, Stefan Schmidt<stefan@datenfreihafen.org>wrote:
>
>> Hello.
>>
>> On Wed, 2010-12-01 at 12:39, David Lambert wrote:
>>> That is indeed the version of documentation that I was reading. To
>>> be more specific, one of the subjects I was attempting to look up
>>> was how to specialize a recipe using "amend.inc". I do not see any
>>> documentation on this subject.
>> We lack a good technical writer in the community. IIRC there was a blogpost
>> from
>> Khem about it and maybe some more infos on the mailling list. Thats of
>> course
>> not the most straight forward location for the information.
>>
>> If you searched together the information it would be great if you could
>> send a
>> patch updating the manual with it. :)
>>
>> regards
>> Stefan Schmidt
>>
>>
> I'm not an expert on the subject, but I've managed to utilize amend.inc
> based on some information I pieced together from the irc logs.  I hope to
> soon write an article on how to use amend.inc, but haven't yet found the
> time.
>
> (This is far from authoritative, but it's been working for me here)
>
> You need to add the following to build-dir/conf/local.conf (can also go in
> overlay/conf/site.conf).
> INHERIT += "amend"
>
> DEV_BASE = "${HOME}/dev/openembedded/dev"
> COLLECTIONS = "${DEV_BASE}/overlay/recipes \
>                  ${DEV_BASE}/openembedded/recipes"
>
> # By default, file:// SRC_URIs only look under the current .bb file.
> # Prepend our overlays into the file:// search path, so we can override
> # openembedded recipes' SRC_URI files. Also, ensure the openembedded
> # files are always in the search path, so our overlay .bb's can
> # reference upstream files.
> FILESPATHBASE =. "${@ \
>          ':'.join([os.path.join(recipedir, \
>                                  os.path.basename(os.path.dirname( \
>                                                          d.getVar('FILE',
> 1)))) \
>                  for recipedir in d.getVar('COLLECTIONS', 1).split()])}:"
>
>
> You'll need to make DEV_BASE and COLLECTIONS match your setup.  This assumes
> that I have two trees with recipes:
>   - openembedded
>   - overlay
>
> This makes sure that for a given recipe, my local overlay will be in its
> FILESPATH.
>
>
> Now, for example, I've added a patch to psplash to adjust the colors.
> In overlay/recipes/psplash/ I have two files:
> amend.inc:
> PR .= "-amend"
> SRC_URI += "file://0001-tweaked-for-company-colors.patch"
>
> and my patch, named 0001-tweaked-for-company-colors.patch
>
> Now, the new patch will be applied when psplash is built.  Also, I like
> updating PR with -amend, this way the package is now shown
> as psplash-0.0+svnr422-r34-amend, so that I can easily tell that I've
> amended the package.
>
> I'm sure there are others who can provide more/better information, but
> that'll hopefully get you started.
>
> Regards,
> Bob Foerster
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



