Return-Path: <net147@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 76F3D737CF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Mar 2015 07:51:42 +0000 (UTC)
Received: by qgfh3 with SMTP id h3so26420806qgf.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Mar 2015 00:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=JhymRfdesF8MmTEqAEIadADlerdhN2l6J4jiSRQ+nOw=;
	b=Ujmvcs9E/JfWjxY+KhzNk5nMO0Su6GsvQksKGKvV7pDZj/WFBllf9U0tEvXEsbdJ3g
	CWOvScM2PRQqi5oqYP5qzBeyhXAJUf2YhV2swz3RtcOpY7KAN/pGQ0/Ejv7cAXTktkum
	32Dbcpv+l4g78Ho9aPr8H/vzeSt8F77wxknsRAGE42IO5VXr+2C1WxznHTu1/VjsACBr
	flnvJVHJMOwEzmFFuL631vdLCPz9dVpWCLikEs1XPUV4FzCyQ3ZpEbu85USCR9JQsvvo
	LyTkArzMT+rJXVnR6Xx+KqSmnEYTBLoFRPdUoXILmvQ99lYSNoU6frctTCNd/B+RBCzS
	pT6g==
MIME-Version: 1.0
X-Received: by 10.140.21.75 with SMTP id 69mr32186937qgk.13.1425887503931;
	Mon, 09 Mar 2015 00:51:43 -0700 (PDT)
Received: by 10.96.56.100 with HTTP; Mon, 9 Mar 2015 00:51:43 -0700 (PDT)
In-Reply-To: <1425812371-1564-2-git-send-email-raj.khem@gmail.com>
References: <1425812371-1564-1-git-send-email-raj.khem@gmail.com>
	<1425812371-1564-2-git-send-email-raj.khem@gmail.com>
Date: Mon, 9 Mar 2015 18:51:43 +1100
Message-ID: <CANwerB1yuL_DBndAnH6WtZz5vfVGeEqG6N0HvC++hxP0mvxUww@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCHv3 2/2] nodejs: Upgrade to 0.12.0
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
X-List-Received-Date: Mon, 09 Mar 2015 07:51:43 -0000
Content-Type: text/plain; charset=UTF-8

Hi Khem,

On 8 March 2015 at 21:59, Khem Raj <raj.khem@gmail.com> wrote:
> +RDEPENDS_${PN} = "curl"
> +RDEPENDS_${PN}_class-native = ""

Does using node actually depend on curl at runtime?
I haven't noticed any runtime dependency on curl when using the node executable.

Regards,
Jonathan

