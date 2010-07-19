Received: from na3sys009aog105.obsmtp.com ([74.125.149.75])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <douglas.royds@taitradio.com>) id 1Oaj42-0008EQ-Vg
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Jul 2010 07:39:13 +0200
Received: from source ([74.125.83.176]) by na3sys009aob105.postini.com
	([74.125.148.12]) with SMTP
	ID DSNKTEPk58wyUn7ukoufxxwTVNrWABbyH3+L@postini.com;
	Sun, 18 Jul 2010 22:38:48 PDT
Received: by mail-pv0-f176.google.com with SMTP id 21so3048091pvc.35
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jul 2010 22:38:47 -0700 (PDT)
Received: by 10.114.183.11 with SMTP id g11mr5939608waf.33.1279497729394;
	Sun, 18 Jul 2010 17:02:09 -0700 (PDT)
Received: from [172.25.113.27] ([202.37.96.126])
	by mx.google.com with ESMTPS id c16sm16283249rvn.1.2010.07.18.17.02.06
	(version=SSLv3 cipher=RC4-MD5); Sun, 18 Jul 2010 17:02:06 -0700 (PDT)
Message-ID: <4C4395FD.20604@taitradio.com>
Date: Mon, 19 Jul 2010 12:02:05 +1200
From: Douglas Royds <douglas.royds@taitradio.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100528 Thunderbird/3.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1279290319.10837.1747.camel@rex>
In-Reply-To: <1279290319.10837.1747.camel@rex>
X-SA-Exim-Connect-IP: 74.125.149.75
X-SA-Exim-Mail-From: douglas.royds@taitradio.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: A new bitbake extension: .bbappend files
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
X-List-Received-Date: Mon, 19 Jul 2010 05:39:31 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/07/10 02:25, Richard Purdie wrote:
> Whilst our layers mechanism, is great it does have a drawback which has
> bugged me for a while. If you have a recipe like pointercal which has
> machine specific information in it and you have your new machine code in
> a layer, how do you add a pointercal file for your machine?
>
> Answer is you copy the whole pointercal recipe and files into your
> layer, then add the single file for your machine.
>    

For our overlay distro, I solved this problem as follows (in 
"conf/distro/tait.conf"):

# Compute a FILESPATHBASE that will cause the FILESPATH search string 
(for file:// URIs) to
# list tait.openembedded directories first, and org.openembedded 
directories second.
# This allows us to put a single file, eg. lighttpd.conf, into our 
tait.openembedded distribution,
# and it will be picked up by OE in preference to the deault lighttpd.conf.
# The directory containing the recipe is not necessarily the same as the 
package name.
# For instance, for lighttpd_1.2.3.bb, we want
# FILE_DIRBASENAME = lighttpd
# FILESPATHBASE = 
"/home/roydsd/Work/DBS/tait.openembedded/branches/2.6.32/recipes/lighttpd:
# 
/home/roydsd/Work/DBS/org.openembedded.dev/branches/2010-02-23/recipes/lighttpd"
# BBFILES is a space-separated list of /path/to/recipes/*/*.bb patterns.
# Split each pattern at the recipes keyword to get 
/home/roydsd/Work/DBS/tait.oe/trunk/,
# then tack on recipes/lighttpd, and
# join the whole lot together with colons
FILE_DIRBASENAME = 
"${@os.path.basename(os.path.dirname(bb.data.getVar('FILE', d)))}"
FILESPATHBASE = ${@':'.join([ pattern.split('recipes')[0] + 
'recipes/${FILE_DIRBASENAME}' for pattern in '${BBFILES}'.split() ])}

For example:

tait.openembedded/trunk/recipes/ntp/
└── files/
└── ntp.conf

BBFILES="/home/roydsd/Work/DBS/tait.openembedded/trunk/recipes/*/*.bb 
/home/roydsd/Work/DBS/org.openembedded.dev/branches/2010-02-23/recipes/*/*.bb"
FILESPATHBASE="/home/roydsd/Work/DBS/tait.openembedded/trunk/recipes/ntp:/home/roydsd/Work/DBS/org.openembedded.dev/branches/2010-02-23/recipes/ntp"

Does this achieve what you had in mind?
Douglas.
=======================================================================
This email, including any attachments, is only for the intended
addressee.  It is subject to copyright, is confidential and may be
the subject of legal or other privilege, none of which is waived or
lost by reason of this transmission.
If the receiver is not the intended addressee, please accept our
apologies, notify us by return, delete all copies and perform no
other act on the email.
Unfortunately, we cannot warrant that the email has not been
altered or corrupted during transmission.
=======================================================================



