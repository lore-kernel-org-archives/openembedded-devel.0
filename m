Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.1106.1589925618801678611
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2020 15:00:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=Krk09+x6;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=ypzx=7b=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49RVDb3RZRz3r;
	Wed, 20 May 2020 00:00:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589925615;
	bh=J7XXrV6IWD5KVYEOqnFK+lCbdkwPVqW5kGm77+6wL64=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=Krk09+x6eQ30iy1to8lMoDL2voEMqOAI8mvOLQaedXaFyadgshB8ZVAhg/0qOZqhM
	 FFzNV/Y4TfuPahA07Jz0X2BY7wGyOtE1bIN2nBK8wlTO53PQi7lp3itLqxZ+VP2kbG
	 Q2VcMZGHcy5jvwXoMOCycVAMHCwWJtnjpx5qkxNXRPltplmIPxJyXcDgi38XDzTrM6
	 khv9mo/CgSujgNJ1Rvw6eYVf1fhkIXwkQxJvnDXVU2aifKxSZos2prVCvw4opwDTVn
	 aLzlSDmT2iUgHNR3XxSH9Tg4V8+AmVn2FkipmA0HBfD6NfGQiAy7bzLYo2vOLHvqsa
	 dUdIsbERKxgh9maTqY/nhQ6joNOlys66ETYksJ6A4xvaUI6pYH+M0tiHOW+d4VbwNm
	 LKbsB9aE4p8v6zRAN6AGvFYweBMNNeCV938765WjQEI6JObLuC7yDXdt42aJDK/5zY
	 6dQdRgWGAI3+Dwr3uk/yloiMGtg905MQn+j7yZ6N/fhlfh9bxkuu66KCy/WJXBMClL
	 EiRUdW7DabxNN0pm+b83pvB+txNMHIlxfAz1q7DO21Schlm6o1U0XhNN1aQEOrELTm
	 ZsVQ3G3kI8u6VZqJwDv89xq2qd6ReR+485/r0L8vUVxkqROcmzYIk7ADEurug8BMNp
	 Eep2wf/ae1mINgzEhivqSlhU=
Date: Wed, 20 May 2020 01:00:09 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] unicode-ucd: Stop broken license downloading
Message-ID: <20200519220009.GA31915@localhost>
References: <16107FFC59C1A7DD.18971@lists.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <16107FFC59C1A7DD.18971@lists.openembedded.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Khem,

it seems some kind of dos2unix was run when you applied my patch,
which changed the license hash.

cu
Adrian
