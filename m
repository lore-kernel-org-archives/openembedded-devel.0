Return-Path: <jacques.guillou@pelagicore.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0CB566CCF4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2014 14:57:38 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id va2so3687566obc.15
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2014 06:57:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=nrxNYpI/7aMlMBxiNWYy1aiAnZOWZp3eceDLXlmR3+A=;
	b=io6QX2hEDu9XhFGmxJ/4vQOp9QHj01DofPrku3YkCiFxYKbTsmD3QQnY3Kq9+dw3tW
	qha5TzrxmRxgUU9sX59CpoZmnjMXC2bCze4UeUM+IcS061mK3lP+HU2RTClthV3HJgOe
	OcZPFLJAWaD3btfejL5Z+1QQ2yh6gG4ju1XSzD1I5cCyATHb5GJmtu+1lWg++2hGB9/P
	pVhuyTlNp1Yr+jN9RJnUhoeMdpxzv8tUK04Ve97OMunE4earC9+mbyBqvFhcHGEHN+8k
	nmz4ZOaECHTxIvAS8zg1dLyB6RBuND7C6qF9HooA6xeg9bZFH15ddfvYV8ElMEfop96l
	w8rg==
X-Gm-Message-State: ALoCoQkFOv0SZEYTdP9XLqaHaNf4f0G6Hygx04e0iVfMO6OqlKY8iGW0gW1A6TG51mH99yQEt44S
MIME-Version: 1.0
X-Received: by 10.182.18.9 with SMTP id s9mr16108947obd.15.1390229859745; Mon,
	20 Jan 2014 06:57:39 -0800 (PST)
Received: by 10.76.92.65 with HTTP; Mon, 20 Jan 2014 06:57:39 -0800 (PST)
Date: Mon, 20 Jan 2014 15:57:39 +0100
Message-ID: <CAAfCovAgZXFnAJa+OsFUUOAiJ=t13ZuzEn-Y0AR-TXdkjTta+A@mail.gmail.com>
From: Jacques Guillou <jacques.guillou@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Bitbake command to clean dependees ?
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
X-List-Received-Date: Mon, 20 Jan 2014 14:57:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

By default (at least with Yocto), it seems like forcing the rebuild of a
specific package (via "bitbake -c cleanall MyPackage") does not mark
dependees as "to be rebuilt", which is a problem for me. Is there a way to
change that behavior ? Maybe there is a specific command or parameters to
be passed to bitbake so that performing a "cleanall" on a given package
also performs a "cleanall" on all dependees ?

I am not sure this is the correct mailing list for that question. If not,
please apologize and point me to the mailing list I should use instead.

Best regards
Jacques

