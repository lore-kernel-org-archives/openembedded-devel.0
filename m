Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Pqnwg-0002Co-4T
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Feb 2011 15:38:11 +0100
Received: (qmail 27814 invoked by uid 503); 19 Feb 2011 15:19:50 -0000
Received: from b6.ovh.net (HELO mail176.ha.ovh.net) (213.186.33.56)
	by 63.mail-out.ovh.net with SMTP; 19 Feb 2011 15:19:50 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 19 Feb 2011 16:36:44 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 19 Feb 2011 16:36:43 +0200
Message-ID: <4D5FD57B.30208@eukrea.com>
Date: Sat, 19 Feb 2011 15:36:43 +0100
From: Eric Benard <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1298032254-26236-1-git-send-email-eric@eukrea.com>
	<4D5E8268.901@mentor.com>
In-Reply-To: <4D5E8268.901@mentor.com>
X-Ovh-Tracer-Id: 15382888953175977289
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCH] shadow: fix rpath issues
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
X-List-Received-Date: Sat, 19 Feb 2011 14:38:11 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Tom,

On 18/02/2011 15:30, Tom Rini wrote:
> On 02/18/2011 05:30 AM, Eric Bénard wrote:
>> * add --disable-rpath (not enough with angstrom 2008.1)
>> * fix build problems with rpath on older libtool
>> * bump INC_PR
>>
>> Signed-off-by: Eric Bénard<eric@eukrea.com>>>
>> +do_configure_append () {
>> + # use same fix as libiconv
>> + sed -i -e s/^hardcode_libdir_flag_spec/#hardcode_libdir_flag_spec/ \
>> + -e s/^runpath_var/#runpath_var/ ${S}/*-libtool
>> +}
>> +
>> do_install_append() {
>> # Ensure that /etc/skel is created so any default files that we want copied
>> into new users home
>> # dirs can be put in there later (ideal for .xinitrc for example).
>
> The equiv I found in poky is:
> do_configure_append() {
> # Fix RPATH issues.
> sed -i ${S}/config.status -e s,^\\\(hardcode_into_libs=\\\).*$,\\1\'no\',
> ${S}/config.status
> }
>
> Any preference? Aside from I think we should be internally consistent in these
> fixes, so long as it's fixed...
>
after testing this one, it doesn't work for shadow (angstrom 2008.1 , armv5
target).

And poky's shadow is not fixed for rpath :
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-extended/shadow/shadow.inc

Eric


