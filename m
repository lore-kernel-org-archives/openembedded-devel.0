Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0B8AB6B073
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2018 18:32:51 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id n2so8715990pgm.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2018 10:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=to:from:subject:organization:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=00OVMlGtnJg+PzdpH226gZallRxUDJmF7DoVXl7ofiY=;
	b=f3PqkUDp/bk4sXx4PTMniNHUSBhbxVjkn04BdiebMcJU4y0BYg5AjI02IqHq7seWt5
	Rb2QzwXZKXnTotb8hi7dXncQyRR4t+fZVuH/hQ/sa3js69RbooNCEe/SlEPUIwlVa31A
	C/aKyIqCMgLauNrtR9tZ85EUsK3Dt2e/BpEW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:organization:message-id:date
	:user-agent:mime-version:content-transfer-encoding:content-language;
	bh=00OVMlGtnJg+PzdpH226gZallRxUDJmF7DoVXl7ofiY=;
	b=lrqS9l/GNX6h+fFd3shiWYZ3W9wCAKgN9s7/8yU5nwhLAgpgL+jiGY+BLyiUjjFfhl
	NmiJ+LUbLDInDSLC4681x1bZb/iMsCVfZQWXP16cjGVSInLvoTmu5AxGYksKD8Dt+xd2
	qPYI8NTIJ4F7OmDWcL2EvRqs5Unb2jigeBo6Cr62zQgVHMpfU4/jHfwlYQhDA0clIBEw
	jxvy8E+O7tM5Ku8Fecfg0tDiWDcknGLP34cx7lDBQTBL6VKeFvuUFcYOTSa6SnESYMFJ
	TDGvebUc7+AWwWMVHornVRcPtW9urbbKzb+rVK8+5MV8WLmX9YTzTJdHyTIEhLsgq8DI
	lwBQ==
X-Gm-Message-State: AA+aEWbsRfwKpzYPaAXcFuRsbxMY7xdvXh41J4t0v4WWQJjmldx7EqH4
	c2cJeCPuSdA1zSuoIz6Y92bvd+rj3sE=
X-Google-Smtp-Source: AFSGD/U7zIEhG7o/lTVStH40iSM72qLOSBrglD80geaAoOjUA88Wwl7/GZs9JiMtQFj3gMIFA9jUjg==
X-Received: by 2002:a63:da45:: with SMTP id l5mr19398640pgj.111.1544639572739; 
	Wed, 12 Dec 2018 10:32:52 -0800 (PST)
Received: from ?IPv6:2601:1c0:ca00:bd01::d5ff? ([2601:1c0:ca00:bd01::d5ff])
	by smtp.gmail.com with ESMTPSA id
	125sm23901246pfg.39.2018.12.12.10.32.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Dec 2018 10:32:52 -0800 (PST)
To: Changqing Li <changqing.li@windriver.com>,
	akuster808 <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Organization: Linux Foundation
Message-ID: <3045fc0b-288e-322f-e4eb-d6ff637abf2f@linuxfoundation.org>
Date: Wed, 12 Dec 2018 10:32:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
Subject: Shall we remove bad-checksum files on http://sources.openembedded.org/?
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
X-List-Received-Date: Wed, 12 Dec 2018 18:32:52 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

With the current setup files will accumulate on 
http://sources.openembedded.org/ over time and none will be removed. Are 
there any patterns that should be removed over time? *bad-checksum* 
files seem like an obvious choice. Please share concerns or suggust 
other patterns to remove.

Thank you,

-- 
Michael Halstead
Linux Foundation / SysAdmin


