Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TDbcB-0007h0-7C
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Sep 2012 15:43:55 +0200
Received: by vcqp1 with SMTP id p1so1043410vcq.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2012 06:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=w21ya+jWuLbuWR2sfLbn6Aq39uK/715A1h0mMEJT/hw=;
	b=sfyfbJQ+Qv9/BmG1AMG/7CxZ0MYtbprDbXGNsliaxva3mNxM9mIuFBaHlCR58eyMgY
	hFIWSjY6Sin4WzHTYULl0NvCYW4XJ90Tre5JDIpjL2zrRLqMaPMoVwUr1bdvvOaDBrAr
	EvgvGG9kqWLp11bsbqlTTjXEg2YU82NumAOFXPBvXWYFpxYK+/J8p5pqiidWdG13ChlO
	wGpiMRfKD0kTb6WcrxnvaHM0KODucoxkWfmEKYEkbczdHcWBexrglkY6Ac6216APfzBA
	2cI3DC7zrIx41zdz9nFVA2DdhecUOti562G1877qfM6jT3UYEiHBYxOmZN/yP5fGY5eU
	TVnA==
MIME-Version: 1.0
Received: by 10.220.16.7 with SMTP id m7mr2779423vca.61.1347888676195; Mon, 17
	Sep 2012 06:31:16 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.47.6 with HTTP; Mon, 17 Sep 2012 06:31:16 -0700 (PDT)
In-Reply-To: <k378fh$nm6$1@ger.gmane.org>
References: <1347879491-2425-1-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKr6hWv7ED5YWxX1vbouE3C-NSySoKxi=7FOW_J-xoFS_g@mail.gmail.com>
	<k378fh$nm6$1@ger.gmane.org>
Date: Mon, 17 Sep 2012 10:31:16 -0300
X-Google-Sender-Auth: CK2itpOJbO4bb8CDmpoxFY72PX4
Message-ID: <CAP9ODKqURDO6Am2mkBH8OdEQL=6JhZLga_-zgV7CX=GdDm6vmw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [for-denzil][systemd update 0/6] Systemd updates
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
X-List-Received-Date: Mon, 17 Sep 2012 13:43:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Sep 17, 2012 at 10:27 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 17-09-12 15:13, Otavio Salvador schreef:
>> On Mon, Sep 17, 2012 at 7:58 AM, Koen Kooi <koen@dominion.thruhere.net>
>> wrote:
>>> A big update to systemd v189. Runtime tested on angstrom.
>>>
>>> This patchset depends on the bluez updates sent to the oe-core list
>>> since bluez uses a deprecated udev API that went away somewhere in
>>> between 182 and 189.
>>
>> This is a too big update for a stable branch in my point of view.
>
> It however is the only sane way to fix all the bugs users have reported with
> system v44. I stopped with backporting patches after the stack grew to 30+
> patches.
>
> So what's your plan for getting the systemd bugs fixed in this branch?

I think the backport is the only option; how you tested it against regressions?

Seriously I'd love a new systemd version in denzil but the risk seems too high

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


