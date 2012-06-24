Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sipuh-0007Xl-9e
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jun 2012 18:43:51 +0200
Received: by eekd49 with SMTP id d49so1025325eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2012 09:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=lafn2GxOAbCwvPRrFpcYhxj2r6yLG6bE3cFoEqI7rlU=;
	b=qy7RstpA3EKIBi1qaGNiSnexqaNNuUlieedapdfbfQIYSooyEViK+cGogc5Me7p16u
	p9N9y7CcWuSj8StQwctnHaN7DoUgz8rGb7/R1IeL4Yr1wGiKv9sDgmtr8m3J6yfkL9IJ
	b/BKlkURdERrT58kPIdz6mYy3KkWFRDHbWZEcKl5ZU5xfzqL7mHUC2VMzBQ932yVKreW
	QBzeajmzv6GAK6HyFijC6sqv3QtNkwiBdRcNKu55NQqb0Xobv0O/5scU7biPO8+F6S2P
	TxNbC8p+R4+2cXu2mUlefERA2smwJaTivjdlnEY8ie3LuMkh3grP9P64S+jN6sOOVLr7
	YuaA==
Received: by 10.14.119.202 with SMTP id n50mr1754098eeh.33.1340555581438; Sun,
	24 Jun 2012 09:33:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.219.71 with HTTP; Sun, 24 Jun 2012 09:32:31 -0700 (PDT)
In-Reply-To: <1340554704-46207-1-git-send-email-elvis.dowson@gmail.com>
References: <1340554704-46207-1-git-send-email-elvis.dowson@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Jun 2012 09:32:31 -0700
Message-ID: <CAMKF1spMQ0qQsQv3hqQ6nTa5GwkfFqje2HdtkFNL6OhPS7XJeA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xilinx 1/2] xilinx-boot: Refactor recipe to add support for Xilinx ISE 14.1.
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
X-List-Received-Date: Sun, 24 Jun 2012 16:43:51 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jun 24, 2012 at 9:18 AM, Elvis Dowson <elvis.dowson@gmail.com> wrote:
> Ensure that you reconfigure your shell to use bash instead of dash while
> building with Ubuntu 12.04 LTS.

why is this needed? may be you can fix the scripts to not have bashism


