Return-Path: <maryan.pricak@gmail.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id E4D8F72F63
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jun 2017 12:51:27 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id w1so74030178qtg.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jun 2017 05:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=hT9I1PXNDTxDrWDhboQtrvIMx9XpFLBR+8Mcv0WhbiU=;
	b=dmBWDiWTEXMMysTOQISU/MfySoiujg4D9a19KM/g4AQ34bOVomQr8Hs4cOmxppHs8W
	2N9WQNqaBUyDTuAqJCK5LlHYIhMWz1+WZyaIpRdP6QWN2Aol+ZkEzdGD58PKdTo/WPiX
	ueU2xTTJKCJiVlIMCH+VnlufZ7Pg9bgSPMzaValKqw/19hzwwXUauV3zg85It8edxiex
	fVxpZKy0rVcZ4i+DDu1Xc7DLkDmVbYTCqHW3oq24yiYHukB0H9adNxbDNQpQi7JPhQOz
	brxYApQ17LX++d1dfi5YaS9QSmVpcbSv4/RXFWcYe6xPrGIYsnsTT853U5jYOveJgZwe
	qYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=hT9I1PXNDTxDrWDhboQtrvIMx9XpFLBR+8Mcv0WhbiU=;
	b=shM+ikPuK2eYsRlNRtF0Isv2mdpeZxFDrzRkoj3OlImX6Pd9lvzHchUhfFvaPrJ8fn
	gXcuUSdACoLkTpgfzD2fJ4jhGrVPR5zEGxITmgupAFAu3FxARyYUZhcLG35uPhOkCJI5
	J4W+WVg9M555Ivw+73T+zYHHY3SaE3AGTb3JbS88WWOJEyq5LS2NwogJop+W63JwuwSY
	bNopim+G1mfGjUokIzEih8UVZt1Va1w9FmZe8y1fGZd2Jtfbz1Qrf2eqXEM/wwT7jZtN
	lAEv5pFvlW94X0GZBxcLQw13UAOWwj9aeXdCwsge3B+t7DIf1VPRXEd6HUQuglu58gCB
	H37A==
X-Gm-Message-State: AKS2vOz8U7Hz7NqXfO8ThYVktZm17RHQTWOA/toLDgBvBAZJwL9dry2u
	LVfOnWiFapHmTG+ir0OFRwuFdOMwbG0S
X-Received: by 10.55.77.209 with SMTP id a200mr33071250qkb.84.1497012688114;
	Fri, 09 Jun 2017 05:51:28 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?0JzQsNGAJ9GP0L0g0J/RgNGW0YbQsNC6?= <maryan.pricak@gmail.com>
Date: Fri, 09 Jun 2017 12:51:17 +0000
Message-ID: <CAGyDAL=5H0Adx81rNMKiBjmF3itmKZYQ1y+FW0EhuQyz=eJivw@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: About recipe for hireidis
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
X-List-Received-Date: Fri, 09 Jun 2017 12:51:36 -0000
Content-Type: text/plain; charset="UTF-8"

Hi all,

I was looking for hiredis recipe and found it in Intel's IOT layer
https://layers.openembedded.org/layerindex/recipe/33258/
Is it a good idea to move it to some generic place like meta-oe where redis
(https://layers.openembedded.org/layerindex/recipe/838/) recipe is, or
should I include Intel's IOT layer to build hiredis?

BR,
Marian

