Received: from [74.125.44.152] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <e.robertson.svg@gmail.com>) id 1KEABh-0002J2-Cx
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jul 2008 23:48:29 +0200
Received: by yx-out-1718.google.com with SMTP id 4so197969yxp.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jul 2008 14:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:mime-version:content-type:content-transfer-encoding
	:content-disposition:message-id;
	bh=cwZrAYnjLI/5d7FMon/pRthKMI0UabbtPaUE5rlklC8=;
	b=lrJBUHzDwnXtfhzvM/Adu2K059LnlNkBgjq0N42KFwJspWSIQd6xeYoUB/cLFiz+te
	4yOIwOGJaccRmMklb+2ZnjtM+QC8Dndx+H/N6BFx8I8OmsPfE5UZ40qMnLaCEy5av1AJ
	+Tsj9FFP+gQhLLOz6xyosyvWFbDzSie9diIFM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:mime-version:content-type
	:content-transfer-encoding:content-disposition:message-id;
	b=RrNrvDqKlSUbF4v0RlObK4I+Xr/tnme3gZtO/lW6sUBMaJUG2t8cxSZ/PMLdI/CMH6
	AZd+p1TPKeNrqXx0j/7BwB8Gu5uu0QZ8Z6zDD8HC8Rurugt5w0diDV1GSpdhAY1dJwZk
	ohq2Ifk3i2BiCgNaQPDzynj0hNzEhUIqG2oOo=
Received: by 10.151.108.10 with SMTP id k10mr5486018ybm.6.1215035112620;
	Wed, 02 Jul 2008 14:45:12 -0700 (PDT)
Received: from vincy ( [74.254.162.162])
	by mx.google.com with ESMTPS id j63sm7287626rne.15.2008.07.02.14.45.11
	(version=SSLv3 cipher=RC4-MD5); Wed, 02 Jul 2008 14:45:12 -0700 (PDT)
From: E Robertson <e.robertson.svg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 2 Jul 2008 16:44:56 -0500
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200807021644.57438.e.robertson.svg@gmail.com>
Subject: pthread issue with GNU_SOURCE
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
X-List-Received-Date: Wed, 02 Jul 2008 21:48:29 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,
I haven't been able to explain this and I'm looking for some help.
I'm building the microwindows package and always stuck with this error:

 error: 'PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP' undeclared here (not in a 
function)

It is defined in pthread.h and after some checking the headers is included 
properly. I explicitly defined _GNU_SOURCE to be true in the package for it 
to compile.

I checked the header files used by pthread.h and it is alredy defined. Does 
anyone knows what could be the cause?


