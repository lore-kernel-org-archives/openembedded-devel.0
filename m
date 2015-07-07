Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 60EA275D26
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jul 2015 15:19:44 +0000 (UTC)
Received: by igrv9 with SMTP id v9so143320567igr.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jul 2015 08:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=2sPFC9cJuR3KwPGWO+m5Dz/iwMvUNjDDOnSibtShDOA=;
	b=uoazipTptQ1yWmv0sJehp6/a037m5MgDeF/r3fz9sANcZA+Xn9T47bQ19RcuP5ATXX
	nmjS26qWVrhQsIIEf4yiKwt5v6jw64R3GV1+zblgDS22zNsqZniyBJQa45eDq6/xSuMM
	+hN3xGTZoBs0DfuDKSyQ5B8kpBNXagmJne1RMjlmWRz51aWpA5X7omWphmezMLaqqrwW
	fEnjD3sYCw6ytTj9i/OhfXZIhfRBBrVM9S8HuDAq01NnNQKj8azt/8YsgwEXiBRtzM5i
	LkSuQXBl8vO3lTWUCNO36z1ZKfvhbcqDfdtWsSbiuUjsUTg81ApCvpwMCzm2qSDamDDl
	BjFg==
MIME-Version: 1.0
X-Received: by 10.50.142.9 with SMTP id rs9mr49438213igb.17.1436282384690;
	Tue, 07 Jul 2015 08:19:44 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.36.218.7 with HTTP; Tue, 7 Jul 2015 08:19:44 -0700 (PDT)
In-Reply-To: <20150612185117.GA5348@linutronix.de>
References: <20150612185117.GA5348@linutronix.de>
Date: Tue, 7 Jul 2015 12:19:44 -0300
X-Google-Sender-Auth: 3fTSXP44AudorXdcjCP7krCSc1s
Message-ID: <CAP9ODKoYyh638rwaOU++7TpQXFzsX6-9FMJFsBAwDJCmb2jYvw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] Trying to build icedtea7 fails currently
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Jul 2015 15:19:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2015 at 3:51 PM, Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
> building icedtea7-native fails currently if the host runs linux v4.0+.
> Duh. I tried to add a patch to "openjdk-7-release-03b147.inc" but it
> didn't get applied=E2=80=A6
>
> Upstream fixed it
>   https://bugs.openjdk.java.net/browse/JDK-8074312
>   https://bugs.openjdk.java.net/secure/attachment/25832/JDK-8074312-hotsp=
ot.patch
>
> I workaround it with linux64 --uname-2.6. It helped but failed later
> with various errors such as:
> | collect2: error: ld returned 1 exit status
> | /home/angstrom-distribution/build/tmp-angstrom_v2014_12-glibc/work/x86_=
64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/ jdk/m=
ake/common/internal/NativeCompileRules.gmk:74: recipe for target '/home/ang=
strom-distribution/build/tmp-angstrom_v2014_12-glibc/work/x8 6_64-linux/ice=
dtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk.build-boot/tmp/sun/sun.=
awt/headless/obj64/awt_Font.o' failed
> | make[6]: *** [/home/angstrom-distribution/build/tmp-angstrom_v2014_12-g=
libc/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build /open=
jdk.build-boot/tmp/sun/sun.awt/headless/obj64/awt_Font.o] Error 1
> | make[6]: *** Waiting for unfinished jobs....
> | jdk/make/sun/headless/../../../src/solaris/native/sun/awt/fontpath.c:91=
0: undefined reference to `FcFontSetDestroy'
> | /home/angstrom-distribution/build/tmp-angstrom_v2014_12-glibc/work/x86_=
64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/ jdk/m=
ake/sun/headless/../../../src/solaris/native/sun/awt/fontpath.c:878: undefi=
ned reference to `FcPatternDestroy'
> | /tmp/cczs6cdu.o: In function `Java_sun_font_FontConfigManager_getFontCo=
nfigVersion':
> | /home/angstrom-distribution/build/tmp-angstrom_v2014_12-glibc/work/x86_=
64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/ jdk/m=
ake/sun/headless/../../../src/solaris/native/sun/awt/fontpath.c:740: undefi=
ned reference to `FcGetVersion'
> | collect2: error: ld returned 1 exit status
>
> Does someone have an idea?

The patch needs to be ported or icedtea to be upgraded; Can you take a
look at this?

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

