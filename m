Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OBcRF-0001kh-Q8
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 May 2010 01:31:06 +0200
Received: by pvh1 with SMTP id 1so88682pvh.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 May 2010 16:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=G1523xOHhxHOFweX/SZAzcoCqImm3rKt6k1OV9v+KbA=;
	b=SYZzX0bWlkAfKumIFtfHSdLUc/dpAwF39UVEM6VFVYmPweinDuYeXpnsiFPwsMIzpS
	uIeLhNgsNHBCYTWIXO7kLYmBVr0TOfGQUwrqjkIIJ/F1z6iapGOwNvGytseW2vg4V5xf
	7lbSMoSuDI0/wKJ77KfDgx2m4JlUK98Xgh3DM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=J8OYFgzCc2BtqAvDAt+FkpYzHt9avfIO+TxNOnPjPQ36qefKkaROeDXxSc4CpWWX1/
	Ca4q+gceouBh51RGbOSS842t9UdLWpvAKXEqHvAiyoEY8NtL+IjSHt9DgUQckfFDE21I
	huFtNE2q8sSySpoZ0nDz6E8Dm1vluW5ZE9hAQ=
Received: by 10.142.2.2 with SMTP id 2mr3158693wfb.75.1273534032217;
	Mon, 10 May 2010 16:27:12 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 20sm4944444pzk.3.2010.05.10.16.27.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 10 May 2010 16:27:11 -0700 (PDT)
Date: Mon, 10 May 2010 16:27:20 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100510232720.GA13708@gmail.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] Move gcc 4.4.3 recipes in favour of 4.4.4
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
X-List-Received-Date: Mon, 10 May 2010 23:31:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

I would like to propose to move gcc 4.4.3 recipes to gcc 4.4.4, 
there are no additional patches that we need and 4.4.4 is superset
of bugfixes. I want to avoid adding additional recipes if we could.
4.4.3 is not so widely used in distributions unlike 4.4.2

I can also just add 4.4.4 and leave 4.4.3 as it is if someone wants
to keep using 4.4.3

Please cast your concerns

Thanks
-Khem


