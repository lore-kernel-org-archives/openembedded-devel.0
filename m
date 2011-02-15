Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PpKMG-0001nI-Si
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 13:50:20 +0100
Received: by bwz10 with SMTP id 10so371516bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 04:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=UgcxGqq/uRxTfpJQaUWUgQLS3hGVYGd5J0NCKvolDzE=;
	b=muCIXT1D1B+0BGAws/uNZzOryGUx4GJZ/gBBPq8WIbUTb/jzIRZ9RYWNtasqNe6+Nd
	VuyrHim14JHNcASC1j3Dz7uxoruGDoDXaxJCnFcassNQR8SlJqCrE/Lu2+5eqQggKj24
	bZ4e2gr561me3g+LO/JP3lBLHZyFEr1zadCOU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=ps9TMrpOkKspPTMgQCmyw+Sid47oDxpyuPIAPS3eagwr0vPJ5B8mVCFHpu1megNxdB
	WIt9nTbUffIfLjfmhsQhavrHybYOQd3xTaq/VhnVAUb+fHkcXL9tNy9NLhbKIkrvzzK3
	Fxd4jCXL0POa82H0W6zz7xGsA3XzPlquprYys=
MIME-Version: 1.0
Received: by 10.204.122.198 with SMTP id m6mr26068294bkr.186.1297774148288;
	Tue, 15 Feb 2011 04:49:08 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Tue, 15 Feb 2011 04:49:08 -0800 (PST)
In-Reply-To: <AANLkTi=OFf7JB6bYsEXCNG1MVNWTP6mFwdj+EhFHLMvb@mail.gmail.com>
References: <AANLkTinN1b=egyKPv6N3rHq1HODKDyK15B22=1qBZcMZ@mail.gmail.com>
	<4D5A4E56.7040209@eukrea.com>
	<AANLkTinHw3SXsx89qis6NeYSxjhKjK278-VgKHXpbw7j@mail.gmail.com>
	<AANLkTi=OFf7JB6bYsEXCNG1MVNWTP6mFwdj+EhFHLMvb@mail.gmail.com>
Date: Tue, 15 Feb 2011 12:49:08 +0000
X-Google-Sender-Auth: _qhzSt2VDwbsNCnrH_x6MNC5KXY
Message-ID: <AANLkTi=+ydSoGjJHkzO1FWNCDhUY0UZZ3PZZn60VqEj=@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFH] qt4-tools-sdk not providing right values
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
X-List-Received-Date: Tue, 15 Feb 2011 12:50:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

The biggest improvement I got was adding the following to my
meta-toolchain-sdk recipe:

    cat > ${SDK_OUTPUT}/${SDK_PATH}/bin/qt.conf <<EOF
[Paths]
Prefix =3D ${SDK_PATH}
Headers =3D ${TARGET_SYS}/include/qt4/
Libraries =3D ${TARGET_SYS}/lib
Plugins =3D ${TARGET_SYS}/lib/qt4/plugins/
EOF

Now it fails to find the X11 libs. Looking at it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


