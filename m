Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gdalex@gmail.com>) id 1RdNuE-0004EP-QG
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Dec 2011 16:16:34 +0100
Received: by eaal1 with SMTP id l1so6765994eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2011 07:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=R7uxpnoVLLgbv8vu5PUxjfWnehUKH79heLQOccpwq1k=;
	b=YtInlXG/XX9Y3pTOUiDaeiNUH5qZ5CbwR/02X5kpXR+KAYKqhu7dFbP+A88VHIR1IM
	uKvBBpQpSjUtvmYma6gtG6lF7qjTgOfpOO7oKr2b2igcaykj5yzaUFZu8PG1TuAnePYy
	E6OgWePDWKgIoaCHiLu8e9ZxBa6YuEDgR7n0g=
MIME-Version: 1.0
Received: by 10.204.157.25 with SMTP id z25mr2157688bkw.25.1324480169616; Wed,
	21 Dec 2011 07:09:29 -0800 (PST)
Received: by 10.205.26.134 with HTTP; Wed, 21 Dec 2011 07:09:29 -0800 (PST)
Date: Wed, 21 Dec 2011 10:09:29 -0500
Message-ID: <CAFggvfNpJGosK3E0pG=Qikk3QXLoOSHndVRqxoTkNUS47_pDQw@mail.gmail.com>
From: George Alexandru Dorobantu <gdalex@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: openssl failing to compile
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
X-List-Received-Date: Wed, 21 Dec 2011 15:16:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello list,

bulding a console-image for beagleboard, openssl fails to compile.

The log shows this:

openssl.o: In function `main':
openssl.c:(.text+0x1eb): undefined reference to `BIO_s_file'
openssl.c:(.text+0x1f3): undefined reference to `BIO_new'
openssl.c:(.text+0x235): undefined reference to `BIO_ctrl'
.....

Removing libdeps-first.patch solved the issue.

Does anyone know if libdeps-first.patch is really needed?
If not, could it be removed?


Thank you
George A. Dorobantu

