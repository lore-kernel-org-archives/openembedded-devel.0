Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1S2hPO-00010w-Ho
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Feb 2012 12:09:22 +0100
Received: by iaag37 with SMTP id g37so780438iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Feb 2012 03:00:53 -0800 (PST)
Received-SPF: pass (google.com: domain of giuseppe.condorelli@gmail.com
	designates 10.50.219.232 as permitted sender)
	client-ip=10.50.219.232; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	giuseppe.condorelli@gmail.com designates 10.50.219.232 as
	permitted sender) smtp.mail=giuseppe.condorelli@gmail.com;
	dkim=pass header.i=giuseppe.condorelli@gmail.com
Received: from mr.google.com ([10.50.219.232])
	by 10.50.219.232 with SMTP id pr8mr6252172igc.51.1330513253491
	(num_hops = 1); Wed, 29 Feb 2012 03:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=MtwW/e53z6Z69IOQTt5gFKTfep0RSIPo11WClJq/uhQ=;
	b=YKKw3YXuSXUIVkq11vjSjNSkt/84uMcZgOPoJlSZilpvSeLGdMjHhDhfKKgwqwgLx/
	PupIikF8QufxZNdqNK6BmMrO4sieMKXsahuVQg6KBXNZ3haRIKalim6XKj4zyH6FwXXN
	ImyfWneGTMe9Va5E5DhSTcS0CWj79L5Cv2IBY=
MIME-Version: 1.0
Received: by 10.50.219.232 with SMTP id pr8mr5202948igc.51.1330513253455; Wed,
	29 Feb 2012 03:00:53 -0800 (PST)
Received: by 10.231.182.68 with HTTP; Wed, 29 Feb 2012 03:00:53 -0800 (PST)
Date: Wed, 29 Feb 2012 12:00:53 +0100
Message-ID: <CAOHjBZss6YRxsOedgF2v_A__XOgH0m=CZWj-OSGY+si+rOSsFQ@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: New task issue on linux-libc-headers
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
X-List-Received-Date: Wed, 29 Feb 2012 11:09:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

I added an own task into my bbclass source (inherited by my conf file). Let
me to call the new task do_NTASK.
Into the bbclass I added:
addtask NTASK after do_compile before do_install
Then I run the base-image build and I noticed that NTASK is regularly
called but for linux-libc-headers, which do_install task doesn't execute in
this situation. If I remove NTASK from the task list the do_install is run
instead. This is causing a big trouble in my goal but I'm not understanding
why...
Please do you have any suggestion?
Cheers,
Giuseppe

