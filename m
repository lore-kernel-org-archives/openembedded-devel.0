Received: from [72.14.246.247] (helo=ag-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vneblx@gmail.com>) id 1KI3Hs-0003Fp-Mu
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Jul 2008 17:14:57 +0200
Received: by ag-out-0708.google.com with SMTP id 9so6522713agd.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jul 2008 08:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type;
	bh=dcCv0KMmcjf2AV/5KjxUYwpDzCu8BwzSVRxHYml0om0=;
	b=YQhYx/whlT6LXnzny/UODHETrehbo1cIUDTavVgjYdVn6/juZK1cVsyAi36WdJzz9Y
	NrM1IbqhCWkjrA6HJu2sizc02vhtaJh7mGXN0dKSzvF75OU7PAonYTUfG1+SXzg5xzCK
	xqT4Ad8TCisTwauLU/4r2+M+P8lbvIySSh5Oc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type;
	b=a1GxxTeCls3vZlIcmiB1gulfHHPmS2N2PT8HjyU+Qq8WV+SazPKa1vcfS12pWcn3dz
	fSYi2PgzrGU9xoO0Hyf+HFcTiqNcXF2pnsLX7RCkEepGPbXT24uCe5tnKstyg56yvHgk
	cNynTd4CXQZ/3Px8EeUBmPEUyHZpMt5wE+02g=
Received: by 10.90.65.5 with SMTP id n5mr13499543aga.110.1215962068992;
	Sun, 13 Jul 2008 08:14:28 -0700 (PDT)
Received: by 10.90.88.13 with HTTP; Sun, 13 Jul 2008 08:14:28 -0700 (PDT)
Message-ID: <c38932520807130814n67204e17w83004499371c6f4d@mail.gmail.com>
Date: Sun, 13 Jul 2008 22:14:28 +0700
From: "Hien Pham" <vneblx@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.10
Subject: Preparing linux image problem
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
X-List-Received-Date: Sun, 13 Jul 2008 15:14:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

After build u-boot and kernel for AT91SAM, I tried to "Preparing linux
image" (http://www.linux4sam.org/twiki/bin/view/Linux4SAM/U-Boot) using
below command:

mkimage -A arm -O linux -C none -T kernel -a 20008000 -e 20008000 -n
linux-2.6 -d arch/arm/boot/zImage uImage

but I received "mkimage: Can't map uImage: No such device".

How can I solve this problem?

Best regards

