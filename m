Received: from exprod5og101.obsmtp.com ([64.18.0.141])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1Nu1Oy-00084j-Fp
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 11:32:05 +0100
Received: from source ([4.79.213.129]) (using TLSv1) by
	exprod5ob101.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS6iX5EFZj9RXKKv9O/376nvgssigU7RN@postini.com;
	Tue, 23 Mar 2010 03:28:54 PDT
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by Alpmlip04.e2k.ad.ge.com with ESMTP; 23 Mar 2010 06:28:52 -0400
Received: from es-j7s4d2j.amer.consind.ge.com (HELO [3.138.54.92])
	([3.138.54.92])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 23 Mar 2010 06:28:52 -0400
Message-ID: <4BA898A8.4040701@ge.com>
Date: Tue, 23 Mar 2010 10:32:08 +0000
From: Martyn Welch <martyn.welch@ge.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20100322160729.4972.62697.stgit@ES-J7S4D2J.amer.consind.ge.com>
	<201003221733.58036.marcin@juszkiewicz.com.pl>
In-Reply-To: <201003221733.58036.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 64.18.0.141
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC][PATCH v2] Alternative to busybox, using "proper tools"
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
X-List-Received-Date: Tue, 23 Mar 2010 10:32:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Marcin Juszkiewicz wrote:
> Dnia poniedziałek, 22 marca 2010 o 17:08:20 Martyn Welch napisał(a):
>
>   
>> This patch provides a mechanism to replace busybox by defining a busybox
>> package which actually just requires a set of other packages.
>>
>>     To get it to be used rather than the standard busybox, define:
>>
>>     PREFERRED_PROVIDER_busybox = "busybox-alt"
>> ---
>>
>>  Marcin: Something like this you mean?
>>     
>
> Yes, few notes:
>  
>   

No prob.

>> diff --git a/recipes/busybox/busybox-alt_1.bb
>> b/recipes/busybox/busybox-alt_1.bb new file mode 100644
>>     
>
> busybox-alt.bb is fine too - PV will be 1.0 then
>
>   
>> +++ b/recipes/busybox/busybox-alt_1.bb
>>     
>
>   
>> +ALLOW_EMPTY = "1"
>> +PACKAGES = "busybox"
>> +PACKAGE_ARCH = "all"
>> +
>> +PROVIDES = "busybox"
>> +DEFAULT_PREFERENCE = "1"
>>     
>
> "-1" is more proper - we do not want people to get busybox-alt instead of 
> busybox by mistake.
>
>   

Agreed - definitely left over from prototyping.

> RDEPENDS = "task-proper-tools"
>
> One line looks better. DEPENDS are not needed.
>
>   

Ok.

I understand that RDEPENDS are runtime dependancies. Am I right to
surmise that DEPENDS are configure/compile/packaging time dependences?

>> +++ b/recipes/tasks/task-proper-tools.bb
>> @@ -4,33 +4,107 @@ PR = "r11"
>>     
>
> Bump PR.
>
>   
>>  RDEPENDS_${PN} = "\
>> +		bash \
>> +		bc \
>> +		bind-utils \
>>     
>
>   
>> +		binutils \
>>     
>
> Not needed - 'binutils-symlinks' depends on it.
>
>   

Ok.

>> +		bzip2 \
>> +		console-tools \
>>     
>
>   
>> +		dhcp-client \
>>     
>
> I added 'pump' - but thats minor.
>
>   

As long as it works, I'm not fussed either way.

>> +		e2fsprogs-fsck \
>>     
>
> In .dev this is in util-linux-ng now.
>   

So I assume I can remove e2fsprogs from this list?

>   
>> +		e2fsprogs-libs \
>>     
>
> What for this is?
>
>   

Shared libraries for e2fsprogs. I'll remove this, I assume this is
either automatically added or not needed.

>> +		ifupdown-ubuntu \
>>     
>
> Can we rename it to 'ifupdown'?
>
>   

We added a recipe to our overlay which used the Ubuntu version of
ifupdown rather than using the Debian version already in OE. I'm afraid
I didn't create the original recipe for our overlay (one of my
colleagues did), my understanding is as follows:

The ifupdown tool does not have an active upstream maintainer, as a
result (at least Debian and Ubuntu) have differently patched copies of
version 0.6.8. The functionality provided by the Ubuntu version provided
a better drop in replacement for the required functionality than the
Debian version and hence we have used this one. As the version numbers
were the same, I created a "ifupdown-ubuntu" recipe for this package. To
ensure it was used here instead of the Debian version, I put
"ifupdown-ubuntu" in the RDEPENDS. Whilst we were prototyping this we
had a "PREFERRED_PROVIDER_ifupdown" entry in our local.conf to force
it's use.

If you think this is unwarranted, we can try using the Debian version
instead.

>> +		iputils-ping \
>> +		iputils-ping6 \
>> +		iputils-arping \
>>     
>
>
>   
>> +		minicom \
>>     
>
> Maybe 'picocom' would be nice too.
>
>   

Never heard of it - up to you.

>> +		mktemp \
>>     
>
>   
>> +		ncurses \
>>     
>
> I added "ncurses-tools" - gives few utils more.
>
>   

Ok.

>> +		openrdate \
>> +		realpath \
>>     
>
>
>   
>> +		start-stop-daemon \
>>     
>
> Nice - I added 'dpkg' instead but it was overkill.
>
>   
>> +		syslog-ng \
>> +		sysvinit \
>> +		tftp-hpa \
>> +		time \
>>     
>
> I added 'shadow' to the list.
>
>
>   
>> +DEPENDS_${PN} = "\
>>     
>
> DEPENDS are not needed.
>   

Martyn


-- 
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189



