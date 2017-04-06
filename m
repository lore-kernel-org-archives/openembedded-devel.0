Return-Path: <andrej.rode@ettus.com>
Received: from mail-pg0-f45.google.com (mail-pg0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5477177A49
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 00:06:38 +0000 (UTC)
Received: by mail-pg0-f45.google.com with SMTP id g2so18815115pge.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Apr 2017 17:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=D06ytqh0r9Tcp5DhB+cqZmicw/xQhGObY0WUp0v+BZY=;
	b=CnSThK0/OvUgGIq6LB5QQz0xBKUKkhtWCyuA6S2+1XB6PVfmveG3FqISl+6l5C7quk
	z9qRvNXJPvYDrtBrcRg/u5fkurv047hDlypNPfemV0Hu4vz7VuuVa7fNtmbrk25IevrI
	z0Zr/NanEPpA04JuPeyq/LokYx7bnFeTd7zH/6qhwiKbNu65PRYWIkGo7zh29/b2iHA7
	yBjazRCSq5dtMT2l6ekp+GyL+QD7XYzoeOVAwHBbrcnDN/vw7tW0amGBE+hjRoI26g57
	KTzCVLpKf9tTTSrObE+01nGNM09JxBrqvOVWor4J5gAtr+y+LslK/tKuQ12gx+HRzJpB
	e9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=D06ytqh0r9Tcp5DhB+cqZmicw/xQhGObY0WUp0v+BZY=;
	b=oIP8+vMF2jjKqO0aQPE+1GF/NPbpi1tCs5UmRuHBp1EpN5LgtftOQ3R/t+btWk2P4o
	B92dXEIx0CP1XVery7ZveQZIPl0TIwDdIwcObENU+KWvyIeeQ31JaWiRYp+w66wuvFvz
	KYPV8RjWHf/u/dtmViyuzz2z/mJvmuSFY3NRBdgzXNJnDJS9bd4P5VIp4gOUooZJSf5a
	kN7IELnGL2rriK6ktWtLCcJVx/6nx1GHIq2n230mc8uZUa2F2a8/+uSiJ3NnTNGT3hxD
	UVuFSFhxZYfTk0yadEhFqaZ2W+1zmk+LC08SmbzUCH6AG3jj4JdMxQUoAbS/V3K+1tmV
	6laQ==
X-Gm-Message-State: AFeK/H3H6JzxrsJI82WCftDATdSTWRzkthtk46a2uCda7aTJgmOUTPqVnJ8BYW35CRHK/3F7
X-Received: by 10.99.103.193 with SMTP id b184mr12587021pgc.35.1491437199722; 
	Wed, 05 Apr 2017 17:06:39 -0700 (PDT)
Received: from FlyingDragon.amer.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id
	j84sm414342pfe.112.2017.04.05.17.06.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Apr 2017 17:06:39 -0700 (PDT)
From: Andrej Rode <andrej.rode@ettus.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Apr 2017 17:06:23 -0700
Message-Id: <20170406000625.1685-1-andrej.rode@ettus.com>
X-Mailer: git-send-email 2.10.2
Subject: (No subject)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Apr 2017 00:06:40 -0000

This patchset adds python-mprpc and python-gsocketpool to meta-python.
mprpc is a messagepack RPC implementation for python.


