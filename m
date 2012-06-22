Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1ShwOa-000301-Ug
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jun 2012 07:27:01 +0200
Received: by pbbrq2 with SMTP id rq2so2973001pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2012 22:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=2/6f2i/wLuGyplGsC8/aBKNzseEBlUeFGIlLJ2c0zW8=;
	b=sAbg7xEtz5h5wkLzBwtIqwsTXMKlUrllAcotx+uXD/fxywv2S1LD4aV+GDy/WbFMUn
	hUbPr/3AkIw7S9Zm7CLN4x/TxMjIyT0zkzPi6PADnDgnxYtUFcunU9Thza1KW1SVTiQi
	hxOQ0cPO1Y5OOWxvjJX/n9umZhO04FmrGmnh/7MFmyK+ixnvBM6OcoqK+9P6K7G/1ZhQ
	/+R8vdqKm+iVv67RlgSda3TbaDtJ43G1MsoyrsJIQcVOdobWCgnD4VlHaYoXpuEtFW0F
	VTgepoHWLXbUsngdH4OBXABWutV/cHBc76qdeXKBtNhPCYHWHLjv8zkW5rkOjWNSQDOf
	Mt/Q==
Received: by 10.68.228.136 with SMTP id si8mr5523697pbc.159.1340342173496;
	Thu, 21 Jun 2012 22:16:13 -0700 (PDT)
Received: from [192.168.1.102] ([94.205.109.242])
	by mx.google.com with ESMTPS id jz4sm37851721pbc.17.2012.06.21.22.16.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jun 2012 22:16:12 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <4FE3F884.1070403@gmail.com>
Date: Fri, 22 Jun 2012 09:16:07 +0400
Message-Id: <519612C8-8937-44B8-B0B5-0B0F032937A3@gmail.com>
References: <1340338450-23907-1-git-send-email-elvis.dowson@gmail.com>
	<4FE3F482.50506@gmail.com>
	<CC9E678D-B16D-472D-9896-2DDA3E23CB19@gmail.com>
	<4FE3F884.1070403@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1278)
Subject: Re: [meta-openembedded] python_numpy: Fix SRC_URI warnings.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Jun 2012 05:27:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi Khem,

On Jun 22, 2012, at 8:45 AM, Khem Raj wrote:

> OK you can just do
> 
> MACHINE=qemuarm bitbake -e python-numpy | grep -i "^SRC_URI="
> 
> and see what it shows.

That command returned empty.

I'll modify the patch with the CONFIGFILESURI as you suggested.

Best regards,

Elvis Dowson


