Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QbcQ6-0004vn-Ta
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jun 2011 19:49:54 +0200
Received: by bwf20 with SMTP id 20so454154bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2011 10:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=E1fVIbZNXoHErozl1f3lsx8c33S+I3l24uvAS0FjmaA=;
	b=Mw35pQykaXa/GtGQt1A4uah8FQgJB3yNz1ImYkWBDDBZrC0GQhUVDYuIOEXK9Piuxm
	gHTxUPh2o1iv1555aZCzlnyyWx4pJtFMHzVeyM01QXPRwmCh2gCxZZFoG2ilvfo8viFf
	UJr91WaR+tpNs0GAMC6Um9UzK/hLIKID5is1Y=
MIME-Version: 1.0
Received: by 10.204.127.14 with SMTP id e14mr2492681bks.65.1309283173418; Tue,
	28 Jun 2011 10:46:13 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.73.70 with HTTP; Tue, 28 Jun 2011 10:46:13 -0700 (PDT)
In-Reply-To: <4E0A0C85.80103@mentor.com>
References: <cover.1309272010.git.otavio@ossystems.com.br>
	<iucpq7$uav$1@dough.gmane.org>
	<BANLkTinqwZhxLGtp997dgKh9BmAD02LU-A@mail.gmail.com>
	<iucsbb$gp2$1@dough.gmane.org>
	<BANLkTimmBeR1COc-BRuASQf3O3g20uhkxg@mail.gmail.com>
	<iud0mc$e52$1@dough.gmane.org>
	<BANLkTikUF5FUaoyWDzJ61dnj7JmNo876eA@mail.gmail.com>
	<4E0A0C85.80103@mentor.com>
Date: Tue, 28 Jun 2011 14:46:13 -0300
X-Google-Sender-Auth: v-S_5FCx-9ts15o6vz-AzlDDt38
Message-ID: <BANLkTi=MbLTvKeV=9Tj+XQhZweR5NSXL+Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 0/2] Fix parse errors
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
X-List-Received-Date: Tue, 28 Jun 2011 17:49:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2011 at 14:16, Tom Rini <tom_rini@mentor.com> wrote:
> It will be, yes. =A0What Koen is saying is that if you're a feed using
> distribution you don't NEED to kick off the build for N machines, just N
> architectures (since you can use sysvinit-getty-r2 and sysvinit-r3 just
> fine, if there weren't any changes to the getty subpackage).

This is broken by design my POV; the right way to handle is to split
the package (as Koen has did) but IMO having this on /one/ binary
package of same recipe is wrong.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


