Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PiLjc-0001BO-2O
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Jan 2011 07:53:36 +0100
Received: by iyj18 with SMTP id 18so1232300iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 22:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=odjfq8l0eMpTxgXK2WXe4G2ZcqIg13zLE4qBdoQhhH0=;
	b=onrv0pvklnL1xhKHLi2NstcVHY6p00qxyKlC2zBCuULR5ngWS61zP4bXu63vdpCtCF
	sWiWh31/ZSYpocCRMU1vB/jNQHQm6FPhYYEaHU4JnzB/CXbF3TaZqOetC/q/zbgK4Sz6
	xAfFEuA7OzlHzj85IMBl66n7MOQVZKeiIU6+I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Pi77jUWTxpeUnKbwsxFCBsSY94LlTESs3dEOUA9uIRsVGgP7Qwzd+hCc9kp7rzJgUJ
	EOj9UnrQ5+tCw1wa21r4Iy/1CDtEMqfBL9rkGrFS27RfdWJZWWv9In7o7qRDpOTN3U1p
	WZRD8LvKtR3nLt25DMOIwySXtt5yhi5QXP0Ks=
MIME-Version: 1.0
Received: by 10.231.166.205 with SMTP id n13mr491598iby.58.1296111166575; Wed,
	26 Jan 2011 22:52:46 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Wed, 26 Jan 2011 22:52:46 -0800 (PST)
Date: Thu, 27 Jan 2011 07:52:46 +0100
Message-ID: <AANLkTinT_uj+VKLP9CxX2rux0_EDai_Zgq-7fsCBEF3T@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: RPATH issues
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
X-List-Received-Date: Thu, 27 Jan 2011 06:53:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear all,

During my mythtv test build I've found the following RPATH issues:

ERROR: QA Issue with libsdl-x11: package libsdl-x11 contains bad RPATH
/home/hudson/jobs/FM_TEST/workspace/tmp/sysroots/ppce500v2-oe-linux-gnuspe/usr/lib
in file /home/hudson/jobs/FM_TEST/workspace/tmp/work/ppce500v2-oe-linux-gnuspe/libsdl-x11-1.2.14-r7/packages-split/libsdl-x11/usr/lib/libSDL-1.2.so.0.11.3
ERROR: QA Issue with libsdl-x11: package libsdl-x11 contains bad RPATH
/home/hudson/jobs/FM_TEST/workspace/tmp/sysroots/ppce500v2-oe-linux-gnuspe/usr/lib
in file /home/hudson/jobs/FM_TEST/workspace/tmp/work/ppce500v2-oe-linux-gnuspe/libsdl-x11-1.2.14-r7/packages-split/libsdl-x11/usr/lib/libSDL-1.2.so.0

and

ERROR: QA Issue with python-sqlite3: package python-sqlite3 contains
bad RPATH /home/hudson/jobs/FM_TEST/workspace/tmp/sysroots/ppce500v2-oe-linux-gnuspe/usr/lib
in file /home/hudson/jobs/FM_TEST/workspace/tmp/work/ppce500v2-oe-linux-gnuspe/python-2.6.5-ml12.3/packages-split/python-sqlite3/usr/lib/python2.6/lib-dynload/_sqlite3.so

I'm not really an expert on either recipes, and don't have too much time.
Someone else care to give this a stab?

Best regards, Frans


