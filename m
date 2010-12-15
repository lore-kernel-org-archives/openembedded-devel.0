Received: from mail-bw0-f44.google.com ([209.85.214.44])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1PSuMF-0001rJ-51
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Dec 2010 17:37:39 +0100
Received: by bwz12 with SMTP id 12so2411293bwz.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 08:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=x0ePdut7tD7RLpd4yLQiP+oCFGCLBFo4N9lAm8cWzws=;
	b=fdi/Myu/Pjf5Qr5f2oDVdXE96EA5ItjfpGkiXbUue5iZAhblfnHhpFUS9TGMq5Ck/O
	R55jraudAlREZbRIA+ZG7bP/vEKEMFdeQIs/SEK75UOzx6rbQeouIzMAoAze97nvpj5B
	iw7TJRKfolhUJzDKRfhPsK7di9kBdW35omHLA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=JEjo/GmgTCgCKJ07JTQSDt/+ND34eqpT+8LbaAhnTe7G22FS5kr7R6gzVJzeKECm8C
	HjtUSxBuxEnZpmmYGs3ZaaszEjQQBdzjTcQVtC0tUsQdkujbS7AmeaSV3Z0+5sQHZyUH
	Xeqp4FkEBXUdgt9b1B5F4YuK+0nXOKnODXnSc=
MIME-Version: 1.0
Received: by 10.204.45.223 with SMTP id g31mr7180975bkf.107.1292430963386;
	Wed, 15 Dec 2010 08:36:03 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.71.8 with HTTP; Wed, 15 Dec 2010 08:36:03 -0800 (PST)
In-Reply-To: <AANLkTin_QS4A+UM2Oj3K82i+rtC4Qd_aD=oTDQ3iZB7q@mail.gmail.com>
References: <1292416949-688-1-git-send-email-otavio@ossystems.com.br>
	<1292417425-1328-1-git-send-email-otavio@ossystems.com.br>
	<20101215130120.GB3238@jama>
	<AANLkTin_QS4A+UM2Oj3K82i+rtC4Qd_aD=oTDQ3iZB7q@mail.gmail.com>
Date: Wed, 15 Dec 2010 14:36:03 -0200
X-Google-Sender-Auth: PmOt2NyArQVB8dV4jZNi1cb-MgM
Message-ID: <AANLkTikSQRgPsWPx2D8kc78T=gyK6HcQxfsDxzwy9_7J@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.214.44
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] classes/gitpv.bbclass: use 'git describe' to for package version
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
X-List-Received-Date: Wed, 15 Dec 2010 16:37:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2010 at 12:27, Otavio Salvador <otavio@ossystems.com.br> wr=
ote:
> about assign to PV ?=3D I agree however why someone might want to use it
> only in PKGV?

?=3D doesn't seem to work. PV is preset so it won't override it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


