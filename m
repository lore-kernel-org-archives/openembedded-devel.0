Received: from mail-ie0-f172.google.com ([209.85.223.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1U2Om3-000785-I7
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2013 17:20:05 +0100
Received: by mail-ie0-f172.google.com with SMTP id c10so5967742ieb.31
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Feb 2013 08:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:references:date:in-reply-to
	:message-id:user-agent:mime-version:content-type;
	bh=YKStVO1livnTyKBAeWZ7Xjke+8vm3qzV+Oh9pzKvTtE=;
	b=oE0oTo60eUQm8RUdPcdwVo0qI75ZfjqODFGm2iNUsRdofIrLk+bDpwTFtcnho7MTC1
	fj6pVNumjMd8peAs9k6aN9jce3YVz64XaaCMDedG4y6RV7z4fBq+CFrqCHo/sTq4q0dY
	o2Brply/YMBZrKnRL/uoCfleoSu4Npt4gzg6QS+XoQFHYGoAHfonUJXSvDD925lvoeMD
	UI53vhk8ijpMyelcbkIb8X/yPwkqyWE7763NVWrGIAeiFTd+9dXwP0M52kZcO6VLAjNu
	uGXQWVNtwwqKvT77D6pX70PmUwWv0dps3iBFVhRa9zSJ0GfaCpSjJpzofrhc1wMypr3i
	kc1w==
X-Received: by 10.50.196.130 with SMTP id im2mr5983662igc.89.1359993854445;
	Mon, 04 Feb 2013 08:04:14 -0800 (PST)
Received: from cl-t066-141cl.privatedns.com.gmail.com (wkit.com.br.
	[67.205.85.241])
	by mx.google.com with ESMTPS id ww6sm15504881igb.2.2013.02.04.08.04.11
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Mon, 04 Feb 2013 08:04:12 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
References: <1359982426-9836-1-git-send-email-mario@ossystems.com.br>
	<20130204120212.GA3271@jama>
Date: Mon, 04 Feb 2013 10:48:20 -0500
In-Reply-To: <20130204120212.GA3271@jama> (Martin Jansa's message of "Mon, 4
	Feb 2013 13:02:12 +0100")
Message-ID: <85boc0ulkr.fsf@cl-t066-141cl.privatedns.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] xinput-calibrator: add --boot-mode comand line option to wrapper script
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
X-List-Received-Date: Mon, 04 Feb 2013 16:20:06 -0000
Content-Type: text/plain

Hi Martin,

On Mon, 4 Feb 2013 13:02:12 +0100 Martin Jansa <martin.jansa@gmail.com> wrote:

> On Mon, Feb 04, 2013 at 10:53:46AM -0200, Mario Domenech Goulart wrote:
>> xinput_calibrator_once.sh has been renamed to
>> run-xinput-calibrator.sh, which now also handles the --boot-mode
>> command line option.
>> 
>> When in boot mode (i.e., when --boot-mode is provided on the command
>> line), the script exits if calibration data is found in the
>> calibration data file.  When not in boot mode (i.e., no command line
>> option), the script runs xinput-calibrator and creates/overwrites the
>> calibration data file.
>> 
>> This change allows other applications to use a common wrapper
>> (run-xinput-calibrator.sh) for xinput-calibrator.
>
> Did you send this upstream?
>
> Can you provide Upstream-Status?

Sorry, I messed up using git send-email (used a file as argument, which
made it ignore --subject-prefix).

Since Andreas is working on a better solution, this patch can be
ignored.

Sorry for the noise.

Best wishes.
Mario


