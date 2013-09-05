Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2FBBE6163E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 15:43:22 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id fz6so2077967pac.17
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Sep 2013 08:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:date:message-id:subject:from
	:to:cc:content-type;
	bh=chdooiNyHbY6cMKa6IVLijl1bsKC4T5KssqEO78thr8=;
	b=TXkn4/dyLjDbdM/i5FvgWRp2b7NAIIJHibi/NW/eX3GMDRjg/i7SRwewH7F1AoOH2k
	AH+LZQPyx86SuGTGPf9K3fQ/m7GDhKntWM7zhqVOlkADF7CwCOFA7DjeG98vxRT9Z5O9
	1TnxgpBQV6VU6oOF+zbwS6r9IWTG0DIOHRGZFbiFcHGmr3cZ3Q0Yzc2cqgxY+jLffqT5
	JCPBr8j63HDwtgp4RWDa1WqcHE+7Kh3DcTLR4dHc4BLWQv8lDgX1DAUmzUudeuIhcs9W
	xXrlRbzUzU6OiQIsYYQEWfPbX83H2YRS5jzFSBhXwnRU6MtsF+Nhl/X2kwnqLwT4ufBH
	sdBA==
X-Gm-Message-State: ALoCoQkyiz2d0HY4XGmbQefw/ZJ9kX9RU8tW6Kxikk5jQ95rvhOxAOVAIiooukHabpMse9ifID3f
MIME-Version: 1.0
X-Received: by 10.66.228.234 with SMTP id sl10mr10013797pac.149.1378395804242; 
	Thu, 05 Sep 2013 08:43:24 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.234 with HTTP; Thu, 5 Sep 2013 08:43:24 -0700 (PDT)
Date: Thu, 5 Sep 2013 16:43:24 +0100
X-Google-Sender-Auth: 4xSi9ntsMXwC5f6fikxz6YjoDG0
Message-ID: <CAOMwXhNZ+gPnaDF20MaXAQLUkEf_7w19pzt4PCS=JLM7_8=g-w@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Dropped libnl fix for net-snmp: Why?
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
X-List-Received-Date: Thu, 05 Sep 2013 15:43:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Joe and co,

what exactly is the reason for this patch having been dropped?

http://patches.openembedded.org/patch/20563/

This was not so thoughtful decision. The current net-snmp version will not
build against denzil, and in fact, this patch should be even upstreamed. I
will take care about that one, but is there any objection against me
submitting this change for net-snmp in meta-networking?

Cheers,
Laszlo

