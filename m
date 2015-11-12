Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 80AF37719C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 14:02:46 +0000 (UTC)
Received: by wmww144 with SMTP id w144so89762566wmw.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 06:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe_de.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=ZmSe23yOpDuWs7PGT/ij6fVjItDCqcLad0cIDAH/K8k=;
	b=J6bPeUXd8XBJ1++NDy1A5omLzvPWQDIh/APdcB9JA7xLP1ZTibmu6fjpUuWDL8lHm9
	YhyIq0m9Y/zuH8wOfY6VVUTJRJRftL1Xniy0KJ3LuIWD8Yryhjwq6r5fUghISCc0r3Jy
	odWNeDHuLxAaPEjdGLG6+zMgiuUzDy2OPPxNTZy3jaB+f19j9dtmblnb+7z9HOCOnjoc
	KnKAXLLdfVO9OrksO2NkT6DbNprWKVzR8kG23NduQ7bcECJ+CAQoYDI4O7jV+ykDe1xO
	95oqGcURjM4/Dn66YmptdSJRrsN4f/zcatIb11DP77wY2BmyPwTccfVeaRF8LZ0EERYv
	ro/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=ZmSe23yOpDuWs7PGT/ij6fVjItDCqcLad0cIDAH/K8k=;
	b=KXP5UafOvto3DnUTC/om1GTrDcJoZ6+klDphR1EzqN7HAEOYqBOD8kufcEgK/OlXl7
	WIlq1gVOIPOfKaqMPuZQ74XbVltdK39nkzrnEpafRg0yjkY/zqGcbtoZ8lBCKNEmujJE
	D8e/2iZeCTmbqdKxHO+hoBgAqo6UekHWPZlbUflXa6Ill0+aMP1uarMY8cOcYn3O/TM/
	Gs4Xkw/KQOypg2o2ZRltQukRTGoU+Be1VclE9L8jUcq2Gw249YYz+ddBRoNFYCpDX/uO
	CSZpF7LxBAH9TvFE3Yu3x63OvZVC0lLNrzNTm+PdRk4A3CNrprBUT96hcauuInALSVVN
	53zg==
X-Gm-Message-State: ALoCoQkexqn3+AcYYRTEocwx/lv1ABK98eop4wc2yAtTzMoM87pHY/8uPsMqwQd1XltZmXGlSbxD
X-Received: by 10.28.24.73 with SMTP id 70mr42033928wmy.45.1447336965073;
	Thu, 12 Nov 2015 06:02:45 -0800 (PST)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by smtp.googlemail.com with ESMTPSA id
	w141sm1982940wmw.24.2015.11.12.06.02.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 06:02:43 -0800 (PST)
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <1447161133-3700-2-git-send-email-sledz@dresearch-fe.de>
	<56435203.1060004@dresearch-fe.de>
From: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <56449C02.2090107@dresearch-fe.de>
Date: Thu, 12 Nov 2015 15:02:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <56435203.1060004@dresearch-fe.de>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] syslog-ng: add UPDATE_ALTERNATIVE for syslog-service
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Nov 2015 14:02:46 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

This fixes [YOCTO-8688].

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

