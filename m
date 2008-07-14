Received: from [74.125.44.152] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1KIQB5-0000dX-RC
	for openembedded-devel@openembedded.org; Mon, 14 Jul 2008 17:41:27 +0200
Received: by yx-out-1718.google.com with SMTP id 4so1443431yxp.30
	for <openembedded-devel@openembedded.org>;
	Mon, 14 Jul 2008 08:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:reply-to:to
	:content-type:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	bh=S+hJDZOYDVccIQ8v36lN/GFUeOovWIoZR6qhWSrHde8=;
	b=qsBxgBkRKcVA6j06obSQ7531iuQAdGT6ddXMnmJDrmBAMi8jQUoOuAXPzSDUl5Tfgd
	hIXvK5/dkJX7uKhU9mw0DxwnOvz5xAlARcFcdZMpy2Kf8P9WJipckkPULTM+T30md3rg
	7Az+gy12J/7FqWNuoRwXPiezKIz7vOVVgWtCc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:reply-to:to:content-type:date:message-id:mime-version
	:x-mailer:content-transfer-encoding;
	b=Y/KAlARcmJSpQrVeybphQYX3Ui7haCI3YxyPyNqMK5I7uolNvqC6LUogEJb11hKSUo
	6owPtuwpZ8MVEnM0BqvuPLNs4Yp4pcuwGQl5UnlN/RhZr47qJCLuRxcCpl+k7QXpBNfE
	Xc6dmwSN+24aH3TFr+gsUq1PbXUnAI0CvKC40=
Received: by 10.142.170.6 with SMTP id s6mr4263805wfe.153.1216050051976;
	Mon, 14 Jul 2008 08:40:51 -0700 (PDT)
Received: from ?192.168.1.71? ( [71.146.10.255])
	by mx.google.com with ESMTPS id 28sm3609188wfd.4.2008.07.14.08.40.50
	(version=SSLv3 cipher=RC4-MD5); Mon, 14 Jul 2008 08:40:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: Koen Kooi <k.kooi@student.utwente.nl>,
	"openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
Date: Mon, 14 Jul 2008 08:40:49 -0700
Message-Id: <1216050049.1093.5.camel@isis>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.2 
Subject: versionsort() in util-linux-ng
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 14 Jul 2008 15:41:28 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Koen,

You committed new 2.14 version of util-linux-ng. It seems its using
versionsort() function. uclibc does not provide this function. We would
need some alternative in util-linux-ng for this.

Thanks

-Khem



