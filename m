Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ahsan.khwaja@gmail.com>) id 1NHb3I-0007dL-B2
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 11:42:51 +0100
Received: by pwi11 with SMTP id 11so16843pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Dec 2009 02:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=+BCuglf5771B02RHBAj6W2Vdr/d8uJl2sUZkkPkijeo=;
	b=C1RzfbjLZj9POatbtnO+Wb8Po458lypapUW8XfcfHeS7wSzvE4PbQWI04WjIXKmO6n
	eA48w0vtyxQW4+QRDEqL2XbkFi+O1NpMJ71uI1HbjeUqUv1JSiPB3lZZxtt8eJ2Y9G9r
	iWNLkpRQkQdnYLBhFtyQA/MNJ0OGfD0379m4I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=gxkaAGVV6b7HkEZgrdog9GkAQT07BhZ/B5A6Rram0nxqS+qVsAtuxc9KPBvSSCJ4Qn
	yRJSchkMPC6iVpW6ssAeS+PCtE9q33vI3pZDsmUcEt/EE7TNCi3UD/8lAWvEK2MgU+ue
	fpN8ws+v9Xh/uAuJ7bL9B8gLY86Qv9pSMZ0eU=
MIME-Version: 1.0
Received: by 10.115.66.10 with SMTP id t10mr11417289wak.20.1260182467908; Mon, 
	07 Dec 2009 02:41:07 -0800 (PST)
Date: Mon, 7 Dec 2009 15:41:07 +0500
Message-ID: <818ccfc40912070241pa211c18ibb1a556607680c6@mail.gmail.com>
From: Ahsan Khawaja <ahsan.khwaja@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: ahsan.khwaja@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: building GCC cross compiler without building any library
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
X-List-Received-Date: Mon, 07 Dec 2009 10:42:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

Is it possible to build GCC cross compiler with support of any library
(eglic, glibc,uclibc and newlib). What should I have to do in this regard.
Does build of library is controlled by
PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc. Secondly just
correct me if I am wrong. Building SDK for bare metal we OE should not build
Linux-libc-header. Is this right?

thanks for helping me out.

regards.

