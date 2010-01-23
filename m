Received: from qmta02.westchester.pa.hmc1.comcast.net ([76.96.53.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john@soundmetrics.com>) id 1NYoYV-0002sy-Nu
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 23:34:14 +0100
Received: from omta02.westchester.pa.hmc1.comcast.net ([76.96.53.7])
	by qmta02.westchester.pa.hmc1.comcast.net with comcast
	id ZANP1d00909Ku2s09AXtmy; Sat, 23 Jan 2010 22:31:53 +0000
Received: from [192.168.10.133] ([75.147.191.205])
	by omta02.westchester.pa.hmc1.comcast.net with bizsmtp
	id ZAXs1d0014SLwm302AXtGR; Sat, 23 Jan 2010 22:31:53 +0000
Message-ID: <4B5B78D9.5060809@soundmetrics.com>
Date: Sat, 23 Jan 2010 14:31:53 -0800
From: John Faith <john@soundmetrics.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.22) Gecko/20090605 SeaMonkey/1.1.17
	(Ubuntu-1.1.17+nobinonly-0ubuntu1)
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <1264273402-29910-1-git-send-email-john@soundmetrics.com>
	<1264276434.3738.53.camel@mattotaupa.wohnung.familie-menzel.net>
In-Reply-To: <1264276434.3738.53.camel@mattotaupa.wohnung.familie-menzel.net>
X-SA-Exim-Connect-IP: 76.96.53.9
X-SA-Exim-Mail-From: john@soundmetrics.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] socat: Add version 1.7.1.2
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
X-List-Received-Date: Sat, 23 Jan 2010 22:34:15 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Paul Menzel wrote:
> Am Samstag, den 23.01.2010, 11:03 -0800 schrieb John Faith:
>   
>> ..
>>     
>
> Thank you for your patch.
>
> 1. Applying your patch gives me warnings.
>
>         $ git am /tmp/\[oe\]_\[PATCH\]_socat\:_Add_version_1.7.1.2 
>         Applying: socat: Add version 1.7.1.2
>         /srv/filme/oe/openembedded/.git/rebase-apply/patch:29: trailing whitespace.
>          
>         /srv/filme/oe/openembedded/.git/rebase-apply/patch:38: trailing whitespace.
>          
>         /srv/filme/oe/openembedded/.git/rebase-apply/patch:46: trailing whitespace.
>          
>         /srv/filme/oe/openembedded/.git/rebase-apply/patch:54: trailing whitespace.
>          
>         /srv/filme/oe/openembedded/.git/rebase-apply/patch:60: space before tab in indent.
>          	IF_IP6    ("ipv6only",	&opt_ipv6_v6only)
>         warning: squelched 13 whitespace errors
>         warning: 18 lines add whitespace errors.
>   

There are space-tabs in the original source file so I'm not sure how to 
remove those.  The other trailing whitespace I see is might be an 
artifact from diff which I used to create 
files/socat-1.7.1.2-cross.patch; I can remove those manually.

> ...
>> diff --git a/recipes/socat/socat_1.7.1.2.bb b/recipes/socat/socat_1.7.1.2.bb
>> new file mode 100644
>> index 0000000..5bbb421
>> --- /dev/null
>> +++ b/recipes/socat/socat_1.7.1.2.bb
>> @@ -0,0 +1,23 @@
>> +SECTION = "console/network"
>> +DEPENDS = "openssl readline"
>> +DESCRIPTION = "Socat is a relay for bidirectional data \
>> +transfer between two independent data channels."
>> +LICENSE = "GPL"
>> +PR = "r1"
>>     
>
> You can start with `r0` I think.
>   
Ok.
>   
>> +
>> +SRC_URI = "http://www.dest-unreach.org/socat/download/socat-1.7.1.2.tar.bz2 \
>>     
>
> Can we do this more generic: `…/download/${P}.tar.bz2`.
>   
Ok.
>> +           file://socat-1.7.1.2-cross.patch;patch=1 "
>> +
>> +inherit autotools
>> +
>> +do_configure() {
>> +	# Override this function to avoid autoconf/automake/aclocal/autoheader
>> +	# since config.h.in gets recreated.
>> +	(cd ${S} && gnu-configize) || die "failure in running gnu-configize"
>> +	oe_runconf
>> +}
>> +
>> +do_install_prepend () {
>> +	mkdir -p ${D}${bindir}
>> +	install -d ${D}${bindir} ${D}${mandir}/man1
>> +}
>>     
>
> 2. I cannot build your patch because checksums are missing [1].
>   
Ok, I'll add this.
> 3. Looking at the difference between `socat_1.3.2.1.bb` and
> `socat_1.7.1.2.bb` there is not much. Could you factor that out into an
> include file e. g. unify this?
>   
I'd rather not potentially break v 1.3 and would prefer not to change this.
> Please fix this up and resend with `[PATCH v2]` in the subject line and
> a note in the commit message.
>   
git send-email really doesn't want to put "[PATCH v2]" in the mail 
subject even when I specify --subject on the command line.  Could you 
point me to the trick to do this?

Thanks,
John



