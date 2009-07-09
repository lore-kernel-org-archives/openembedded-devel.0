Received: from [209.85.210.193] (helo=mail-yx0-f193.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MOut4-0004jL-EV
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Jul 2009 16:46:14 +0200
Received: by yxe31 with SMTP id 31so273756yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jul 2009 07:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=hWmNgTpq1StA/JJ/Z9JyOxaSS2oI0WsOvdCMO7tzv8o=;
	b=anN4mAn2q7VUcqYGdMIqYlPZaC7kWxmqIr4wJ5uMBek6NrH2MK0vsZHFoseiFhHFl1
	/3WbVeGB3ivuX9hu2aV3r6QzAiXTzRNi4IyqtUd6bZ2jD9Gy9hdrFJ5RoykPI7xI4rAT
	x2QzRTR9PMBt859+f9zkWD9jhdWapJfhR544o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=crXWQ24Yte1PRAbU9SxToZrNM6tQtnTRWbyh2Olx5lEiod6mcbGQm0REB1vIGVg1be
	4fVhtUFjEdBkw2HsIfIkdX92GdlKop+nCk+HwvLJ2gAur+0UQFbts9QkMSYaHT3njds/
	ZLNCrs7B4FdBowJIyuVhA1TJF1lwAC9ui25j8=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.154.17 with SMTP id b17mr1190028ane.45.1247150004646; Thu, 
	09 Jul 2009 07:33:24 -0700 (PDT)
In-Reply-To: <be7a9f3d0907090708n76b215d0id9b0ab7364f5b61e@mail.gmail.com>
References: <be7a9f3d0907090612k3babae30h64d0424a4fe8dcc0@mail.gmail.com>
	<be7a9f3d0907090708n76b215d0id9b0ab7364f5b61e@mail.gmail.com>
Date: Thu, 9 Jul 2009 11:33:24 -0300
X-Google-Sender-Auth: 97ba3de10a2b508e
Message-ID: <be7a9f3d0907090733l2bf493a2mfc63118844705ced@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFH] Stable qemu-native BROKEN
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
X-List-Received-Date: Thu, 09 Jul 2009 14:46:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

On Thu, Jul 9, 2009 at 11:08 AM, Otavio Salvador<otavio@ossystems.com.br> wrote:
> http://pastebin.ca/1489573

I've found two important issues regarting qemu and glibc changes in stable:

qemu-native 0.10.3 doesn't compile in my host system but 0.9.1 does fine.
last change to pass LD_LIBRARY_PATH to qemu during locale generation
ONLY works with 0.10.3.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


