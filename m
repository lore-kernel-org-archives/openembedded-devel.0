Received: from [206.190.48.165] (helo=web52402.mail.re2.yahoo.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <lucian_ion_2000@yahoo.com>) id 1MTv24-0006eV-KZ
	for openembedded-devel@openembedded.org; Thu, 23 Jul 2009 11:56:12 +0200
Received: (qmail 91115 invoked by uid 60001); 23 Jul 2009 09:41:56 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1248342116; bh=BnJcEVyr/7LSRMy0zKBABjoIGakQpQ3so0bCBKrnMk4=;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:References:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=djYSYMvXJWwhEb0JLdbiyYbAQ1YhRO8Q0gStdWsw1jliReZSePt2zJSKJEhvZpzC24kY64tGzUDlTGDWEZ0hB5jkN6vuACPcxIf115wcvmg05v9geUFXHLwUJvhf/Kto+vdwbHcLdgfdR/3WOTR2WOvAlxIOlOv97hzTanyNaxU=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:References:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=tDjkYC6Mc7Ge3bDHr5P6Z+KgjulZhnUrQQfZzdyCsnFQNeoDScD6OjDR7HA3DY5fOWYbOplvH6yhsFLLAEO4coHk5CaYUFfeNH+OxhD4GRfa77CJxGvfabEQpng4r0XT4cYXwyn5cwzfGFtaS5UsMGgGqQXA3zvBkJEcj5h+eRk=;
Message-ID: <327329.90781.qm@web52402.mail.re2.yahoo.com>
X-YMail-OSG: ztczqBkVM1n39Pl5v2x.JqIPpXTK6TexRIybNelkR.NTThE4gXjt6NPN8mK.b_mxo1VOs7.VICcJXlw_cmjsD7P_K8pFu55MzeGwCen_bWsVXtSJmC5aFjZUKhxdZEF.dbSAG3YDK6OiHc5x.9l.uhiFjy0X8RLk._ZqZOzWei1k3gxDLfCte2IZ19vRVLOXtu__V71T6Bi33dBbwEVGmWZX0JRtq6IgsTHoORWqUYcBp2k0esUVzy7PDwmrabzrHMAuL5LO6vRFqRK2moLYZ9K3sesR9EwZCgqtDNW7SRHjjqeslDHG2QyF9xwmN2UrbOUtzP1W1nFsp9OvyIIFTxKq7oevG1NBpfZt0n9G5yCJiA--
Received: from [87.198.251.22] by web52402.mail.re2.yahoo.com via HTTP;
	Thu, 23 Jul 2009 02:41:56 PDT
X-Mailer: YahooMailRC/1358.22 YahooMailWebService/0.7.289.15
References: <4A62DF07.8000804@dresearch.de> <h3unsp$1cs$1@ger.gmane.org>
	<4A62E981.40607@dresearch.de>
Date: Thu, 23 Jul 2009 02:41:56 -0700 (PDT)
From: Lucian Ion <lucian_ion_2000@yahoo.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4A62E981.40607@dresearch.de>
MIME-Version: 1.0
Subject: Re: do_qa_configure apr-util_1.3.4 fails
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
X-List-Received-Date: Thu, 23 Jul 2009 09:56:13 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


I've compiled it by removing the config.log file.=0AI suppose this is not t=
he solution but it works.=0AIt complains about using hosts includes but it =
doesn't.=0AHowever after compiling and running on the arm at91sam9263-ek ma=
chine these are the results:=0A=0AI've run the apr v1.3.5 library tests on =
the platform:=0A=A0=0A./testlockperf=0AAPR Lock Performance Test=0A=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=A0=0Aapr_thread_mutex_t Tests=0A=A0=
=A0=A0 Initializing the apr_thread_mutex_t (UNNESTED)=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 OK=0A=A0=A0=A0 Starting 1 threads=A0=A0=A0 OK=0Amicroseconds: 247820=
8 usec=0Aapr_thread_mutex_t Tests=0A=A0=A0=A0 Initializing the apr_thread_m=
utex_t (NESTED)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Failed!=0Athread_mutex (NE=
STED) test failed : [70023] This function has not been implemented on this =
platform=0A=A0=0A./testmutexscope=0ATrying proc mutexes with mechanism `def=
ault'...=0A=A0 Mutex mechanism `default' is global in scope on this platfor=
m.=0ATrying global mutexes with mechanism `default'...=0A=A0 no problems en=
countered...=0ATrying proc mutexes with mechanism `flock'...=0A=A0 Mutex me=
chanism `flock' is not global in scope on this platform.=0ATrying global mu=
texes with mechanism `flock'...=0A=A0 no problems encountered...=0ATrying p=
roc mutexes with mechanism `sysvsem'...=0A=A0 Mutex mechanism `sysvsem' is =
global in scope on this platform.=0ATrying global mutexes with mechanism `s=
ysvsem'...=0A=A0 no problems encountered...=0ATrying proc mutexes with mech=
anism `fcntl'...=0A=A0 Mutex mechanism `fcntl' is not global in scope on th=
is platform.=0ATrying global mutexes with mechanism `fcntl'...=0A=A0 no pro=
blems encountered...=0A=A0=0A./testall =0Atestatomic=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 : SUCCESS=A0=A0=A0=A0=A0=A0=A0=A0 =0Atestdir=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 : SUCCESS=A0=A0=A0=A0=A0=A0=A0=A0 =0Atestdso=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 : FAILED 8 of 9=A0=A0 =0Atestdup=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 : SUCCESS=A0=A0=A0=A0=A0=A0=A0=A0 =0Atestenv=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 : SUCCESS=A0=A0=A0=A0=A0=A0=A0=A0 =0Atestfile=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 : \|||\SUCCESS=A0=A0=A0 =0Atestfilecopy=A0=A0=A0=
=A0=A0=A0=A0 : SUCCESS=A0=A0=A0=A0=A0=A0=A0=A0 =0Atestfileinfo=A0=A0=A0=A0=
=A0=A0=A0 : SUCCESS=0Atestflock=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 : SUCCESS=0At=
estfmt=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 : FAILED 1 of 9=0Atestfnmatch=A0=
=A0=A0=A0=A0=A0=A0=A0 : SUCCESS=0Atestargs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 : SUCCESS=0Atesthash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 : SUCCESS=0Atestipsu=
b=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 : SUCCESS=0Atestlock=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 : SUCCESS=0Atestcond=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 : |Segme=
ntation fault=0A=0A=0A----- Original Message ----=0AFrom: Steffen Sledz <sl=
edz@dresearch.de>=0ATo: openembedded-devel@lists.openembedded.org=0ASent: S=
unday, 19 July, 2009 10:38:09=0ASubject: Re: [oe] do_qa_configure apr-util_=
1.3.4 fails=0A=0A>> /opt/openembedded/recipes/apr/apr-util_1.3.4.bb, do_qa_=
configure)=0A>> ERROR: This autoconf log indicates errors, it looked at hos=
t includes.=0A>> Rerun configure task after fixing this. The path was=0A>> =
'/home/sledz/work/HydraIP/OpenEmbedded/tmp.3/work/armv5te-angstrom-linux-gn=
ueabi/apr-util-1.3.4-r5/apr-util-1.3.4'=0A>> ...=0A>> I'd a look into the c=
onfigure log (see attached file) but couldn't=0A>> find the autoconf proble=
m which causes this error. :(=0A> =0A> The error would be shown in ${S}/con=
fig.log=0A=0AI also couldn't identify the problem there. Attached config.lo=
g contains some "No such file or directory" and "cc1: internal compiler err=
or", but it's not clear to me if they are part of the tests or real problem=
s.=0A=0ASteffen=0A=0A=0A=0A      


