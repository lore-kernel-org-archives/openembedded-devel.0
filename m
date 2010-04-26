Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <spyzer.abhishek0@gmail.com>)
	id 1O6J5V-0003Bj-8d; Mon, 26 Apr 2010 09:50:50 +0200
Received: by gwb11 with SMTP id 11so355093gwb.6
	for <multiple recipients>; Mon, 26 Apr 2010 00:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=L4K7qFlxR5ji+LpEZ7s7CSoM8uAp+/nPudr1pzhs6w0=;
	b=xhG2wp2Rvup9xr514Ex64lKBIDFYx8x7KuQPYhlhHWvRGg3CNiAPAqjxe2JdeCxXXY
	ImZGXNt9I+NtkfgFohDOv8vn4h9Vuw7o3Hxhd3OoJteecyyNZCy6wx/cE8Kvri6u6Rer
	wBLUOnZWlSMkqBEwySCAMwdWP0uovA9LFOGPo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=Q+9KyncWAkpFCrnBT6d+6o+unlanHQkJ0teqPDV9S78XQl06lCljBLfSpMzh1DJTR6
	uAyrFibngwnLjjpG+rQiOGMRp+WNn+7Nj1mTq9XHxtWQQEWZUvVPwLxRYtLNyWS6UGDG
	iOxloucdNZtzEcM45tgpGJo7DrzHHgiu3K400=
Received: by 10.150.7.9 with SMTP id 9mr3683298ybg.285.1272268020166; Mon, 26 
	Apr 2010 00:47:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.150.144.11 with HTTP; Mon, 26 Apr 2010 00:46:40 -0700 (PDT)
In-Reply-To: <n2kfc0861611004260035m8d19c57ez38a19dbbe360efe8@mail.gmail.com>
References: <n2kfc0861611004260035m8d19c57ez38a19dbbe360efe8@mail.gmail.com>
From: Abhishek Sharma <spyzer.abhishek0@gmail.com>
Date: Mon, 26 Apr 2010 13:16:40 +0530
Message-ID: <v2hfc0861611004260046za2daa3a4ve91f93ab88e72d8e@mail.gmail.com>
To: openembedded-users@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: spyzer.abhishek0@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Regarding customized image with Qt embedded support.
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
X-List-Received-Date: Mon, 26 Apr 2010 07:50:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello all,

I am building an image for mini2440 which should support Qt embedded
applications. I even made a test recipe of a simple Qt embedded app(namely
"qtehelloworld") and then I wrote the image(namely qtehelloworld-image) as
such:

IMAGE_INSTALL = "qtehelloworld"
IMAGE_BASENAME = "qtehelloworld"
IMAGE_LINGUAS = ""
IMAGE_LOGIN_MANAGER = ""
IMAGE_INIT_MANAGER = ""
IMAGE_INITSCRIPTS = ""
IMAGE_DEV_MANAGER = ""
RDEPENDS = "qte"
DEPENDS = "task-base"
require base-image.bb
inherit image

here qtehelloworld as I mentioned earlier is a simple/sample qte app. Before
deploying to mini2440 I am testing the image for qemu by setting the conf to
MACHINE="qemuarm". But when I run the image, I am unable to find the
"qtehelloworld" app inside the image(to run the app). Kindly tell me, why is
such a thing happening.

Thank You.

-- 
Abhishek Sharma

