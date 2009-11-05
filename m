Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1N6BVq-00016n-AF
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Nov 2009 00:13:09 +0100
Received: by bwz9 with SMTP id 9so561960bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2009 15:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=H7aGqd4mVyktUJx8udyRsV7RFbBEzaIeXWtidzNcsrk=;
	b=XGa0hVPU2M5rKypXYdhXCs8ZOn/HCmpItVwb+KVFRH45o+siAyalcKcpI4K9zXkee0
	+b8oJOWvOBXpP/3FY182GXsKa8+4geh/vmr5fJtolzNCzVfQdd/Fbk7wa1gcfJmu7qc7
	5umIjpLCaMJYU30eLnkcakrhMRIZ7ZWtbH/HQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=ryUB/W4KXIdppGT7KA24TEV14w8kaJI4O7f5fqy4PMJwWcns3ZPGdbh7vOkHTxEyGw
	BQSYF/w/RDIEMsjihuLWLhlijr8jyJ0e3UDzGSKSJAurtH7dV8U0ZTyNPwzbEAl9x4ld
	0lrocceKmDgJIuJ43rGBTg+QujK5Jm2iZ7FN8=
Received: by 10.102.222.8 with SMTP id u8mr1332938mug.96.1257461374960;
	Thu, 05 Nov 2009 14:49:34 -0800 (PST)
Received: from ?10.0.0.13? (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	t10sm3705590muh.43.2009.11.05.14.49.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 05 Nov 2009 14:49:33 -0800 (PST)
Message-ID: <4AF35674.5040608@gmail.com>
Date: Fri, 06 Nov 2009 09:19:24 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4AF2B936.4020105@dresearch.de>
	<baaef4710911050521m19cdb480k3460a4715d939563@mail.gmail.com>
In-Reply-To: <baaef4710911050521m19cdb480k3460a4715d939563@mail.gmail.com>
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: opkg memory problem?
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
X-List-Received-Date: Thu, 05 Nov 2009 23:13:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

01234567890123456789012345678901234567890123456789012345678901234567890123456789
When OE does 'opkg-cl install $EVERYTHING', all the memory leaks in opkg
start to accumulate. My guess is that somewhere a memory allocation failed
but was not checked for failure, then everything started to blow up.

Obviously, the memory leaks should be plugged (working on it...) and memory
allocations checked for failure (hopefully all sorted in opkg svn now). But
there's still a danger that large images will exhaust the supply of memory,
causing massive thrashing if nothing else.

The following is untested and only reduces that chances of this occuring,
but perhaps it makes sense to do something like this?

diff --git a/classes/rootfs_ipk.bbclass b/classes/rootfs_ipk.bbclass
index 16dd511..58e5f45 100644
--- a/classes/rootfs_ipk.bbclass
+++ b/classes/rootfs_ipk.bbclass
@@ -53,9 +53,9 @@ fakeroot rootfs_ipk_do_rootfs () {
 			done
 		fi
 	fi
-	if [ ! -z "${PACKAGE_INSTALL}" ]; then
-		opkg-cl ${IPKG_ARGS} install ${PACKAGE_INSTALL}
-	fi
+	for i in ${PACKAGE_INSTALL}; do
+		opkg-cl ${IPKG_ARGS} install $i
+	done
 
 	export D=${IMAGE_ROOTFS}
 	export OFFLINE_ROOT=${IMAGE_ROOTFS}



