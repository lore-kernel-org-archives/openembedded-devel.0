Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1QwHVr-00036D-QX
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Aug 2011 19:45:15 +0200
Received: by ywa12 with SMTP id 12so1015894ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2011 10:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=cB/NoClf1WyQoJRs9mdv/nim75EHysY9Py+eFlC0rzI=;
	b=jt0FAEUvaoz8p8lMvvIsQuTLvhVBtPqIqMyGbboPkJjGLzS5ni4CYUBRexYZZ06atn
	fV45xl8Gvt8rCaNpvGtA4pJNuKd5kwq3YYRePOgNK7m8+NfycmSF5Dw76KFibCSYfeLo
	x6P2/3YZ4UbC5ybqo+04gDcPgvT/it/QZ/GuE=
MIME-Version: 1.0
Received: by 10.42.168.66 with SMTP id v2mr4736610icy.104.1314207628864; Wed,
	24 Aug 2011 10:40:28 -0700 (PDT)
Received: by 10.42.220.70 with HTTP; Wed, 24 Aug 2011 10:40:27 -0700 (PDT)
In-Reply-To: <1314199372.21496.12.camel@jjg-linux>
References: <4E4E536D.7010103@dresearch-fe.de> <4E4E738C.70109@dresearch-fe.de>
	<4E5356B2.3060908@dresearch-fe.de> <4E53583A.3030405@gmx.net>
	<4E535B83.9080508@dresearch-fe.de>
	<CAFu+nvEh9tUGzQM1PFo1ErtOq+a+0yg94pZBO6Ohr92GNZoKBg@mail.gmail.com>
	<1314199372.21496.12.camel@jjg-linux>
Date: Wed, 24 Aug 2011 10:40:27 -0700
Message-ID: <CA+M6bXnG5iaUuv=60=cXGqACXzmnFL0PpGMkhUcbMNzsy+TnmQ@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance] do_compile failed for cacao_0.99.3.bb
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
X-List-Received-Date: Wed, 24 Aug 2011 17:45:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2011 at 8:22 AM, Jesse Gilles <jgilles@multitech.com> wrote=
:
> On Tue, 2011-08-23 at 13:16 -0400, George C. Huntington, III wrote:
>> I suspect that the problem is happening earlier, classpath isn't buildin=
g.
>> =A0the javac wrapper eats the return code from a java compile.
>
> If George is right, then the following patch to the javac wrapper script
> may fix the issue. =A0It fixes building classpath as well as returns the
> error code if all javac attempts fail.
>
> http://patches.openembedded.org/patch/9521/

So... someone needs to get that into either oe.dev master or better
yet update the java bits for meta-oe.

--=20
Tom


