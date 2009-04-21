Received: from [74.125.44.154] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1LwN0I-0005Lt-QS
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Apr 2009 22:55:42 +0200
Received: by yx-out-1718.google.com with SMTP id 36so1022257yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Apr 2009 13:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=owI+FoDGv+VlvlaoPQSeW735lsQuU2mSu7sNuXYDaJE=;
	b=bqjeB6ALwOtikvKqQjq3K38fIRCL9PtInKXojaV8mj0HmKFkz6FQX1lM7e8I/Mknd0
	wPWDi3iU7LiqghbLrLejb95RQnZ7OtyWJ3DD0LiZizgmEfoDMUg5yCr5BwPR5WUYVCbH
	3FDY5TXrtcDvW69PXb+aUMfvY7M8T0ERO7Z1c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ECRw1gUWMSUtuS6eXlkyegnaTDO8EFEQM0s5XHY81CmJmen9fbnJNCpvmNeL17G1XL
	LSi9Y8IsUbBFIcwbDhINqXZC4Y+u0W/3k/wGIvt7PsJxrlACC+dyoYShqoB9aXzOxRFD
	4PuofMEDK2/e+p2gFuz2ScR83SUM4DsiJa85A=
MIME-Version: 1.0
Received: by 10.90.113.11 with SMTP id l11mr9350454agc.2.1240347075198; Tue, 
	21 Apr 2009 13:51:15 -0700 (PDT)
In-Reply-To: <1238404723-8814-1-git-send-email-khimov@altell.ru>
References: <1238404723-8814-1-git-send-email-khimov@altell.ru>
Date: Tue, 21 Apr 2009 22:51:15 +0200
Message-ID: <c384c5ea0904211351l607d74d2s2a010bf7a4138977@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf: use ROOTFS_SIZE for gzip'd images
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
X-List-Received-Date: Tue, 21 Apr 2009 20:55:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

On Mon, Mar 30, 2009 at 11:18 AM, Roman I Khimov <khimov@altell.ru> wrote:
> Make ext2.gz and ext3.gz images use ROOTFS_SIZE parameter for genext2s (as
> non-compressed ext2 and ext3 does).
>
> This allows to use IMAGE_EXTRA_SPACE configuration.
>
Could you explain how this works?


Regards,

Leon


