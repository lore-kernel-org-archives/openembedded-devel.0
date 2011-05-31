Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QRQgH-0000rB-L8
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 May 2011 17:16:30 +0200
Received: by bwz5 with SMTP id 5so4266501bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2011 08:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=f5hm3t5npXRzcQlxFcaU+df/w20ij3FjzsP7LnLo8Iw=;
	b=TU9/gLxdGC376aBHWadIwm3kt9wnk11+johTaJFkYpD8FSx7ui8v5kgzkWdZvds+zi
	Vbjk78jIwqktX6FrvGPEK22zmfrW3M8wHkGQy8FiVs0kEGzFe0kLfLgtCWp/jSqvHlzX
	ODl6/qfXQEHWSKeGCpCYMmG51lyeOpfc0V/64=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	b=C7g61rIn51db4BH1EokqsSW72xLbbKOXoLx2upaiU43uoxa+hUndRHHgbvD9g3WeFX
	V8K2PBhyyb/E4Sdpy53T82c5cc8WHdoEUEPZmxQYSVmVvAMFezBTdYC+Q1xSt28mKGzI
	YCsRSwqfvgDt5SzCz6RLMQAa+mT6xZBo5Oiws=
MIME-Version: 1.0
Received: by 10.204.47.18 with SMTP id l18mr5816596bkf.31.1306854800315; Tue,
	31 May 2011 08:13:20 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.78.203 with HTTP; Tue, 31 May 2011 08:13:20 -0700 (PDT)
Date: Tue, 31 May 2011 15:13:20 +0000
X-Google-Sender-Auth: KaD_B3r8xljW6f6Rwu-_E6eNaNs
Message-ID: <BANLkTi=qZLnR+PJX7yV+=MnD=rkNJAh9Cw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Koen Kooi <koen@openembedded.org>
Subject: [meta-oe] udev 171 is broken
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
X-List-Received-Date: Tue, 31 May 2011 15:16:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

Our system stoped to work and all the probing has starting to fail. We
tracked it down to udev 171 update. It used to work fine but now fails
completely. Reverting back to udev 164 fixes it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


