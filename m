Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4EB4671E06
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Feb 2017 17:05:08 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id j13so161094541iod.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Feb 2017 09:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=tmseMeL/GTSOI5gx+VELheJ40jyLVtBYRCBu+mxIpZ8=;
	b=CBdrKs+hXstwhmeGsE0sTUv4UpsNfg4RBrmfUk0vBXzbnQ3Lr7qLDlbEzIo2xXDFsI
	8n9R4eL48G8sZDiQmeoCQftxpOWPZwWz/yn3rDUhz0Z2ImsyURIg5/A9ONfHsvRPiEyH
	wi9V9aUY7rgvkjW8j/i/okfqXUCrMG/0FZhr+bzpdM47eVH2Df4zrkvHBgY8DIjURLnv
	qizh1D8PPkwf2NnSAMOUtC7GSXF/F70c5cUzk8ungxyMwaVjps8ABCNc7Ea6XCn4RPID
	VrRhThvovCDHhip3wyMGN+sEqODUQcuUr2IKZN1iT6J9jHBJ1rbVJCes5jEb6TP3sHLJ
	DHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=tmseMeL/GTSOI5gx+VELheJ40jyLVtBYRCBu+mxIpZ8=;
	b=q2eJbbvBY6d56xgx1BL3joQVcraAiqJt1/1BhrzJ+uIeVyayvz/tgzzR3TKikiieLz
	nmb1W+EvzeRdOsmwdnR702ozAbMdchRMu2YhCOts1kXeNtInsCAhwa4MNFs3wWx3gAjK
	QIKNPo/72DLIQjOzWU8MX+VsLBFgsIhaYHEnh9ejJTC+Sn1/WEL2tWnKsnSL010WUuWz
	2aIebuyPanyx4e56/zxDndsjq503crUdEDyRindT/oCcK4KVTJuy2SU7bXIKmpWrPf4E
	EpcRzSL/8euF8Rnt9hdwKC5OjTmnqyTZHSpGtptw6rI8e7McCRQ3lxmVcZqmeRWHGKes
	ogaQ==
X-Gm-Message-State: AIkVDXJQodHnb8SwklCZQO5ZnP5UkkpxSm52RrJgkTJYnWfg3IiY6+eAwRlgJDqKqhgq9Q==
X-Received: by 10.107.10.42 with SMTP id u42mr2795560ioi.197.1485968709157;
	Wed, 01 Feb 2017 09:05:09 -0800 (PST)
Received: from linux-uys3 ([45.72.230.114]) by smtp.gmail.com with ESMTPSA id
	p191sm10304084itc.4.2017.02.01.09.05.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Feb 2017 09:05:08 -0800 (PST)
Date: Wed, 1 Feb 2017 12:05:06 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170201170506.GA3280@linux-uys3>
References: <1485887424-1814-1-git-send-email-jaragunde@igalia.com>
MIME-Version: 1.0
In-Reply-To: <1485887424-1814-1-git-send-email-jaragunde@igalia.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: otavio@ossystems.com.br
Subject: Re: [meta-browser][PATCH v2] chromium: split patch 'Remove hard coded values for CC and CXX'
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
X-List-Received-Date: Wed, 01 Feb 2017 17:05:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Thanks, this fixes my build.

