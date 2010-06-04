Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OKgKD-0002An-KK
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 01:29:18 +0200
Received: by pwj4 with SMTP id 4so748582pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 16:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=n8xZh4JfWtvL8gSA2ma3WnAqeM9Q/BQtUl2lMF0P80s=;
	b=KpveTgHXEAI0sDfB8F3gwm0g91nDWB4uX/FupLgIW3Qrgoz72YDo57Fy/YDZZq6QyW
	d/dIF7AFuxuPdCwFNeB1SrMx38iFBGTzf2+gc4PXMx83u7qubPenaXk2PVk9IRevb7MY
	CSvilegYQ14Ch4MMvDUblmI+5byEDMGZs8X1M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=kUiiEMJQH29NSVtSevoxAah94egi91e7ymKwtixXqmxpX1C684PNhfKlHt3j/b1KqA
	tNT23Fai/nJoK/KD397Wq8Z/O9zDo/GUdhkJeXC8WqCnNt3lZvTGdMnKrMcII5Yz/JX+
	iEb2GYC0XzYuQ3/L8jbwvqy8l3f2oK8Cd9r0k=
Received: by 10.141.2.10 with SMTP id e10mr9511799rvi.240.1275693898483;
	Fri, 04 Jun 2010 16:24:58 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id b10sm2817551rvn.15.2010.06.04.16.24.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 04 Jun 2010 16:24:57 -0700 (PDT)
Date: Fri, 4 Jun 2010 16:24:23 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100604232423.GA9174@gmail.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: dbaryshkov@gmail.com
Subject: pcmciautils: fix build to use flex from sysroots, not from host
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
X-List-Received-Date: Fri, 04 Jun 2010 23:29:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

This commit 

commit c65ee13298e8c22274b5bcabe06f2116b8b7ebf2
Author:     Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
AuthorDate: Fri Jun 4 16:26:17 2010 +0400
Commit:     Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
CommitDate: Fri Jun 4 16:44:18 2010 +0400

    pcmciautils: fix build to use flex from sysroots, not from host
    
    Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>


breaks the build when I have flex-native in ASSUME_PROVIDED.
It there any specific reason why one should use flex from hosted sysroot ?
is the flex package on all distribution broken for some reason ?

Thanks
-Khem




