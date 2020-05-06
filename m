Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
 by mx.groups.io with SMTP id smtpd.web11.3610.1588761111858667548
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 May 2020 03:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=dTR3yIJN;
 spf=pass (domain: skidata.com, ip: 91.230.2.91, mailfrom: prvs=388eec6a1=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1588761112; x=1620297112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1F0/EhHbtAv4g2RAHYVkFCXTALjh9Rv3kcpWD27Wva0=;
  b=dTR3yIJNQj46b+zAMuhwtrjdOBZBTI1FQa/DAFv3kUj3JaoJ1uDTlFnc
   rXmhGbxXBLN02wXLBSywbGW9zjJZl2Th1x2+qCfXHff5zz4TWt5W9SsvG
   5O8aekBp3EH26v64W/M8jQS6J9eKS8DCXSCzFZYwPqUR469Qiy9cHO2vd
   mJKzq52lsCYO2guEWh47Y3dhBxpEfYCu7/rIC8ZX9ulmOCwLEr7JMVeMN
   bZjjylSAFdjwY+YrJ9RZ0mi8PINXc85zAJHn1yze9jm9hclmYiOXb9Kqg
   t8xHb3YI3tbi0DJkw4yZmTtd64nBghLTkssOVrbwpes6tz5kimEa9upIA
   w==;
IronPort-SDR: SoedEt1NFLko0H9K/sI8iYcJlIP5xBfQwUFQzemUXgRUXBBfwnZpSX7NexuLXvHsrt5WC5lJfe
 0mXgcZjm6r3W3i1y46EFHyJOj51zmLCXkhqqR4EWkCQ4AJrCm56FJoRE22XFX+SUz79Pw2VFr/
 0Yz5MO5i/k9SPo8f17U4i5lcQS1fsoND5beExjE7wyGpf9AgCjCKKBeRVNFzYPMekVFJ5PxUfy
 v2urtm1p+toS6+uWSmjVT8VPgQgJePGeZan8k3QRIN5j0pJgcfQOLxa9/9gmg98aEU1YJVpE/R
 UT0=
X-IronPort-AV: E=Sophos;i="5.73,358,1583190000"; 
   d="scan'208";a="2575667"
Date: Wed, 6 May 2020 12:31:47 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <jacob.kroon@gmail.com>
Subject: [meta-java] master-next merged to master & dunfell
Message-ID: <20200506103147.GD250994@pcleri>
MIME-Version: 1.0
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,
this is a note to let you know that I've just merged master-next of
meta-java [1] into the master and dunfell branches.

Following patches were merged:

Jacob Kroon (3):
      openjdk-build-helper: Fix decoding GCC major version
      icedtea7-native: Fix building with GCC 10
      openjdk-8: Fix building with GCC 10

Richard Leitner (4):
      docs: UPDATING: pipe curl calls to "head"
      openjdk-8: update to latest ga version 252
      openjdk-8: require GCC >= v6
      openjdk-8: remove -Werror

If you have any questions or want to see something backported to older
release branches please just reply to this message.

Thanks & regards;rl

[1] https://git.yoctoproject.org/cgit/cgit.cgi/meta-java/
