Return-Path: <george.mccollister@gmail.com>
Received: from mail-ig0-f193.google.com (mail-ig0-f193.google.com
	[209.85.213.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7C498731AF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2016 21:04:12 +0000 (UTC)
Received: by mail-ig0-f193.google.com with SMTP id mw1so20522224igb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2016 13:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=tV4OVKjWlgPEJm4YbthYPXNq0Q4140BUk6rbiXMCxSg=;
	b=QdoFKm/5sOovBgrgcJ3K5DyTUMFZ2cwPMu//eGl9guoc6JsUGkOiF+N23oEAuR3DPR
	6ZYq/T2CmpapUI0Gq8+KbJuCpid5nt+alHN42oYgFsopaxPi2hKTrS56xHKgVOwgLCeI
	RL86CNh/zB4iTWDH9iuaqL2wunOMuIPBUUFYPRnjkqmeIFnvFP4TRIb7/Fl2M5EH1KY0
	cbuhP3JEFcOcAJGhzEvmc9bCenMAOCJmXA7cqhGzkufs6Ly+UPYEwbcQhNGEvdJz/CkV
	RY6tXn/7b51SLW/ZBUfMPDHLzjA5aKlEEIOH3K95vEqTLDdpSOyLY+1mN/Usw9zsqYD6
	rPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=tV4OVKjWlgPEJm4YbthYPXNq0Q4140BUk6rbiXMCxSg=;
	b=m/nqb6OjPXrcF/0lf2vn7uL423AoK09INh3Is4+6aiXmsOuAqI8Oj3yLDDA6rt4UXV
	x8z99NNW7tWpOnkwFFxMKb0aZgUs6PFNRBj6DAN+IDFBPFxqIbjuyRWDx94t8i1Z1yEo
	6ObJ1u1xMwhzjkNwBf5qsTUpRQJlxK4N7uvoUM0PzXmkzQuOdRfP/Cs35psGv7/rgXLs
	Q9NWy1Dm8gLASpdsT3fAR+iFgoEn17DAm6jyT54MzGLRbrw73KK5gZ760vFdG35SMC8T
	7bkj9AQonX7CrhFmTPfF3cKr9DpSsrdRqBDNu1uMq5jRL7fPnBNW+qSJ0ZiQ5FtOCHdN
	XncA==
X-Gm-Message-State: ALoCoQlUK8BrDttCiw9Xfw/l8fKPs82RDH6MScY7TCcUMYFW7WPaRI2s7RAM4vS8+B6Cv8TErhLJqpgo0VcuxZSDRPRcQOTj8A==
X-Received: by 10.50.137.40 with SMTP id qf8mr32504095igb.8.1452805453051;
	Thu, 14 Jan 2016 13:04:13 -0800 (PST)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52])
	by smtp.gmail.com with ESMTPSA id 81sm3210754iod.31.2016.01.14.13.04.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Jan 2016 13:04:12 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Jan 2016 15:03:32 -0600
Message-Id: <1452805416-22520-1-git-send-email-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.4.5
Subject: [RFC][PATCH 0/4] cleanup packaging of bash completions
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
X-List-Received-Date: Thu, 14 Jan 2016 21:04:13 -0000

This series accompanies my series of the same name sent to openembedded-core.


