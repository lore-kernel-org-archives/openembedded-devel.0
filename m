Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1NAOkS-00046w-2T
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Nov 2009 15:09:39 +0100
Received: by yxe5 with SMTP id 5so5559yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2009 06:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=h9HpDbLj7t0htvZjACd2bKzrvF7Qekx1W13h36K/PNY=;
	b=xA533x7T8V20C6fbIPDIrmeJYpUMJ/At+nM2JZ0OzullxVV94BiKKVLqVTu3juWrTT
	8Tbimdwu8mAL/PSpJkX1JS+trX5dNidqKHHc9i2y403ysxvmStp+7H9d6eE8YW9b/IFC
	bNgyxaBkc8++e/OpgnKhopgxUOGq8jJUKa0UI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=kbr4We0/a2vmsjrfFgei+MNYH0zbch7CCv1FbHE1hJQRpzvHsUAgNvSHgS9X1hPiPo
	kcu4h/46+lmrtdE7NAavksV9cHisPMPai6b2rPz2ZmNGBvwGzhFItJWrNEAJZu3KbJmm
	DuZJJe1/lE6xFSkF3zBddKFACm/4DBiUNIFdg=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.183.26 with SMTP id s26mr866752hbg.179.1258466888799; Tue, 
	17 Nov 2009 06:08:08 -0800 (PST)
In-Reply-To: <200911171502.40498.marcin@juszkiewicz.com.pl>
References: <200911171337.35127.marcin@juszkiewicz.com.pl>
	<200911171502.40498.marcin@juszkiewicz.com.pl>
Date: Tue, 17 Nov 2009 12:08:08 -0200
X-Google-Sender-Auth: 8164959d189baf54
Message-ID: <be7a9f3d0911170608w214df901y8c376f0f67fe26c1@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: RFC: Geode machines support changes
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
X-List-Received-Date: Tue, 17 Nov 2009 14:09:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Tue, Nov 17, 2009 at 12:02 PM, Marcin Juszkiewicz
<marcin@juszkiewicz.com.pl> wrote:
> I found one problem with it. Currently we have some geode machines as i586 and
> some as i486 but packages are generated with "geode" arch each time. Same for
> tmp/cross/ dir etc. So we will need to decide for all devices at once.

I think the way to go is to test if gx is compatible with i586 and
then check of performance lose with it. Then we see if:

 - we can merge geodelx and geodegx?
 - we need to have geodelx and geodegx with different base arch?

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


