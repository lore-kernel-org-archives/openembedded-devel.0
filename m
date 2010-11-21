Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PKEM8-0005r6-Vm
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Nov 2010 19:09:42 +0100
Received: by wyb34 with SMTP id 34so1761471wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Nov 2010 10:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=dhZ+yNiPRruDoVKWaAyRC+ROHOpCQaqRJK/G76LxeOU=;
	b=j1cG3kEHTc7zRqnYAMjbLEMaMQAOUTg23iHAIVCdLsnkmZAfGNMkpRwKf3VnHfvlvI
	OcNIDBQB+CVns6rASUtxn8dtPo6rWLkuSCf/ZtryVSqrqi30fwj1ZrBGgiV01SY3ikpO
	3Lkuh7MoWHZTF98jxBdwCVg0MUlrYhOjdHAeM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=StPIEO9Ab91hO/2FL9dIf0y1MsZWgK43jKADLqTSxAtuB9rUJUnrCkErA3DFgPm3c/
	hT++br5dES0vwHZWx2fd1z/F7P9J+NlFbniNa7vtiejXYPAec/EsUt6MkTWMvAv1ocCJ
	LzlXLLEyBPhgamVriUK59aYDuQxtdPWETgS9c=
Received: by 10.216.3.3 with SMTP id 3mr3252252weg.57.1290362909965; Sun, 21
	Nov 2010 10:08:29 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Sun, 21 Nov 2010 10:08:09 -0800 (PST)
In-Reply-To: <4CE7D1F2.7010305@sensortherm.de>
References: <4CE64779.3020802@sensortherm.de>
	<AANLkTinAj4fG48Ppz_jwT1nmp+tzntZ9YJPaqat4HbES@mail.gmail.com>
	<4CE7D1F2.7010305@sensortherm.de>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 21 Nov 2010 11:08:09 -0700
X-Google-Sender-Auth: XmYfO2FrRXBOS7ZpHYPVVkqffWQ
Message-ID: <AANLkTi=VB3EJo1DU2pGWgCSqFrZX81t1Es4xTHP3eCWU@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: buildserver
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
X-List-Received-Date: Sun, 21 Nov 2010 18:09:42 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Nov 20, 2010 at 6:49 AM, Klaus Schwarzkopf <
schwarzkopf@sensortherm.de> wrote:

>
>  Other good idea is to have sanity checker running once per day too. It
>> may do next things:
>> - check recipes syntax
>> - check thath recipes SRC_URI can be fetched
>>
>
> I think, bitbake can easily integrate this two features.
>
> For example the new options:
>
> --download-only                 only download the source files for the
> given recipe
>
> --download-only-with-depencies  only download the source files for the
> given recipe and its depencies
>
> --check-syntax                  check recipes syntax



This seems pretty foolish and unnecessary to me.  This can be easily done in
the metadata -- there's no need to modify bitbake for this at all.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

