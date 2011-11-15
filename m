Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mgargela@gmail.com>) id 1RQP0a-0007qr-6m
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Nov 2011 20:49:28 +0100
Received: by ywt2 with SMTP id 2so4993368ywt.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Nov 2011 11:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=h3mHzCunGLVDmH/9xZjEQbrKQrQHqzGIZ4GHbvr8KFw=;
	b=dmIHwBMsznV4YfRAC9q5vnD8xjZeSEqFZZSmGPfnwQsZ+E2j2btcBCIfIZTs5TllML
	TzU4QnLcBIPUu9j6gok4PpCNCvg4SlWKoq7wsrHSFzGHwLeNaBjr//sgeJ/m/hUP73NP
	vlKFxQAUM15X5Clc/cRXUgBt30YarWUZTw2NU=
MIME-Version: 1.0
Received: by 10.100.130.14 with SMTP id c14mr1988873and.114.1321386185022;
	Tue, 15 Nov 2011 11:43:05 -0800 (PST)
Sender: mgargela@gmail.com
Received: by 10.236.110.7 with HTTP; Tue, 15 Nov 2011 11:43:04 -0800 (PST)
Date: Tue, 15 Nov 2011 21:43:04 +0200
X-Google-Sender-Auth: xIxFCilk9oLGLoEaTXjkMAQc6p0
Message-ID: <CAObi9r-fY1M+5PbW=ZXxfPigrT_yrOabWv9C1_2VL-OBg037Xg@mail.gmail.com>
From: mgundes <mgcse@hotmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: wrapping bb and updating base bb environments
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
X-List-Received-Date: Tue, 15 Nov 2011 19:49:28 -0000
Content-Type: text/plain; charset=UTF-8

   Hi,

   I wonder if there is a way to wrap a bb file. For example, I use
dropbear with oe classic but I need to make some update in dropbear init
script. I copied oe/openembedded/recipes/dropbear/ to another bb path which
has higher bbfile priority. In this case bitbake find bb and files
in workarea/recipes/dropbear/ and I update init script in
path workarea/recipes/dropbear/dropbear/init. It is ok and work fine
however I duplicate whole recipe files for my little update. Is there a
better way do same thing without duplicating whole files such as simple bb
wrapping original dropbear bb file?

   Since oe is so modular and talented I though there would already be a
way to do that :)

BB>> which dropbear
SHELL: This command needs to parse bbfiles...
NOTE: Handling BitBake files: / (8377/8377) [100 %]
NOTE: Parsing finished. 7604 cached, 448 parsed, 325 skipped, 1 masked.


 /home/kays/Perforce/checkout_010811/dev/argela/firmware/oe/openembedded/recipes/dropbear/
dropbear_0.52.bb

 /home/kays/Perforce/checkout_010811/dev/argela/firmware/oe/openembedded/recipes/dropbear/
dropbear_0.49.bb

 /home/kays/Perforce/checkout_010811/dev/argela/firmware/oe/openembedded/recipes/dropbear/
dropbear_0.51.bb
 (***)
/home/kays/Perforce/checkout_010811/dev/argela/firmware/workarea/recipes/dropbear/
dropbear_0.51.bb


Thanks,
Regards,



-- 
MahmutG

