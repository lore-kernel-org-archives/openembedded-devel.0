Received: from web53912.mail.re2.yahoo.com ([206.190.38.161])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <cwoloszynski@yahoo.com>) id 1NBZVM-0000cD-Hh
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 20:50:55 +0100
Received: (qmail 79406 invoked by uid 60001); 20 Nov 2009 19:42:45 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1258746165; bh=XuGHYP5Autr8HFZsMWQg7IEtC079HIGrKATLWRMq1o0=;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=cTpHjWje0dOlouQuAc5fI/lz1ivqhNoDSme6/BlUBV8HzUpWJTMO275QE0RqZemfYmZjJwCcKZIT8ApWQNjOvoeOyAPn9Rr2cPt4m7pNRiQxHHjSYh63MpCZe9NYDMieQ0MQcgvLQsM6ECY/4ix0xXgCROeKr/5ZPNQz3aQR010=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=KwOoWIoZbpUt13DnMKDLhkEoJh7rWBKJ9YKnptwqJVixs6UHJt9WVgSuSIP810SWAm6Y1XW2JKLIWXvu23MPN/gUKSKWAjyqRj94aFkdUH9FgMN4GmdJEXl6CuRGclVzOQQzOFvroutBGRjlhz1hqG2hz6RYKJzrYuXfVhHUsLg=;
Message-ID: <721719.79016.qm@web53912.mail.re2.yahoo.com>
X-YMail-OSG: tNg3HIwVM1kMMJLM_TndPXO2MA..uC4ocareWBMxqFEn1uwHkerW60jf_vIMFo6q3HDb8M56NBhoq_YiIXtl1lkv_vnKgtn3BsuFKIwPeMjS6p85hhJYeTpVzmXAiXHi3sq.80fYJfqA2E0gZseV1ymVYBMu5dXQte1uZgHQjKpX4ZGW0biCUM62sRtDevxyLLgTvX4bW949SynmspKz.FKK7O9bTWBwrZoPPtodFqarUVz3NpxsoSXTH5qOiPYcF8t5KDRZlJLR9vDiPoK27Fs4ApOctrLJqtcpRLUAVHBM77TiFuNnP5cCzQ--
Received: from [68.100.74.251] by web53912.mail.re2.yahoo.com via HTTP;
	Fri, 20 Nov 2009 11:42:45 PST
X-Mailer: YahooMailRC/211.6 YahooMailWebService/0.8.100.260964
Date: Fri, 20 Nov 2009 11:42:45 -0800 (PST)
From: Charlie Woloszynski <cwoloszynski@yahoo.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 206.190.38.161
X-SA-Exim-Mail-From: cwoloszynski@yahoo.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Objective C cross compiler recipe?
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
X-List-Received-Date: Fri, 20 Nov 2009 19:50:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I am working on an OMAP project and I have been asked to include some Objec=
tive-C code into the project.  =0A=0AI am looking at the build process and =
it looks like gcc-4.3.3 is built with objective C support, but I don't see =
the headers or runtime library installed anywhere for cross compilation.  =
=0A=0AGCC, as put in ./tmp/cross/armv7a/bin, seems to know objective-c but =
does not know where to find its header files (and I assume its runtime will=
 be an issue right after that)=0A=0Aarm-angstrom-linux-gnueabi-gcc main.m=
=0A>main.m:1:24: error: objc/Object.h: No such file or directory=0A>In file=
 included from main.m:2:=0A>List.h:4: error: cannot find interface declarat=
ion for =E2=80=98Object=E2=80=99, superclass of =E2=80=98List=E2=80=99=0A>m=
ain.m: In function =E2=80=98main=E2=80=99:=0A>main.m:8: warning: =E2=80=98L=
ist=E2=80=99 may not respond to =E2=80=98+new=E2=80=99=0A>main.m:8: warning=
: (Messages without a matching method signature=0A>main.m:8: warning: will =
be assumed to return =E2=80=98id=E2=80=99 and accept=0A>main.m:8: warning: =
=E2=80=98...=E2=80=99 as arguments.)=0A=0AI was hoping that someone who is =
familiar with the GCC recipes might be able to provide some guidance on thi=
s.=0A=0AAnyone have any experience with this?  =0A=0AThanks,=0A=0ACharlie=
=0A=0A=0A      


