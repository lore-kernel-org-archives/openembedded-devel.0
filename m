Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pg0-f52.google.com (mail-pg0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 969EC72FDB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 01:58:47 +0000 (UTC)
Received: by mail-pg0-f52.google.com with SMTP id z128so8340487pgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 17:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=subject:to:references:cc:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=gUeJsHKGXwn73ozOAN42iCx3SiBd62iTqCEhEtHhqn8=;
	b=ReO8dXQjcW2/NIpxlT7q9xIhW3zIZAOINdSP2Ans6mniinBz0zJVbluB7NIGvhVi6p
	2Bf56ZJsxPNJln1idd12xFcvOd5/pNvL3a09MbOGRb/PPeNP+hTp91JsI55ZxiL6UxnQ
	u2nUw4MOboLm3pW15b1ZPME7EiuOJXlznh2YM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=gUeJsHKGXwn73ozOAN42iCx3SiBd62iTqCEhEtHhqn8=;
	b=H4GqHMsOwQUJnJ2KkPuKnk50IHKFE8ckM2Z50xKBDCtNRoWFFT2NuThBmGdBxjzQfW
	6ZThKwzOLl4hcrE5LI7AsSwajMvXmBxGiq/ZZiy6vhgl4PzpGzDqeLoTef7jI6j+2FEA
	dQENQk4LoYbRWNbWwjDH8V/3uXW9TWad3BUkKe+liVIgnRCXINk7wMoFmoFwWvAEsJpI
	uVvrry4nHlo1i7pKft6PxM0BKtJP7joCnbm9z3b5Q6QJPT1I5RtrkKC620SKAg7jrszc
	/deIJtP0J91PWSOysx2E/7fs9XazPrxfSMGkwtzwECwB+GAHUi24sl54BFJgoNqmSLrj
	UVxA==
X-Gm-Message-State: AMke39kDySRtXtL795UI1fvF8jOMJqt1uj/ygYlx1ESOpmzjIDOgNKYpzHZ/O2IN+YmjEEey
X-Received: by 10.99.132.66 with SMTP id k63mr44154203pgd.41.1487815129146;
	Wed, 22 Feb 2017 17:58:49 -0800 (PST)
Received: from yct-lpt.lan ([67.23.202.154])
	by smtp.gmail.com with ESMTPSA id h70sm392094pfe.59.2017.02.22.17.58.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Feb 2017 17:58:48 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>
References: <20170222213254.GH3283@jama>
	<506a5e6c-36f6-7b1f-a375-24bebb57342f@linuxfoundation.org>
	<CA+chaQe23zrLkeJ81iyWxx__=S2PDjGtTSGqm8x5KZOtMd5D_w@mail.gmail.com>
	<20170223015317.GJ3283@jama>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Organization: Linux Foundation
Message-ID: <f0a0ba96-6f15-049a-2a46-b1ef04da9f29@linuxfoundation.org>
Date: Wed, 22 Feb 2017 17:58:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170223015317.GJ3283@jama>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Before you ping some older patches
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Feb 2017 01:58:48 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 02/22/2017 05:53 PM, Martin Jansa wrote:
> On Thu, Feb 23, 2017 at 12:48:22AM +0100, Martin Jansa wrote:
>> Hi Michael,
>>
>> thanks for quick fix.
>>
>> The hook now shows error about sendmail I wasn't seeing before:
>>
>> OE @ ~/meta-openembedded $ git push origin master-next
>> Counting objects: 78, done.
>> Delta compression using up to 8 threads.
>> Compressing objects: 100% (25/25), done.
>> Writing objects: 100% (78/78), 7.35 KiB | 0 bytes/s, done.
>> Total 78 (delta 56), reused 66 (delta 49)
>> remote: No sendmail executable found.  Try setting
>> multimailhook.sendmailCommand.
>> To git.openembedded.org:meta-openembedded
>>    eb7979113..0d27137f0  master-next -> master-next
> Now it found some sendmail... 
>
> OE @ ~/meta-openembedded $ git push origin master-next 
> Counting objects: 85, done.
> Delta compression using up to 8 threads.
> Compressing objects: 100% (71/71), done.
> Writing objects: 100% (85/85), 18.90 KiB | 0 bytes/s, done.
> Total 85 (delta 47), reused 0 (delta 0)
> remote: Sending notification emails to: openembedded-commits@lists.openembedded.org.
> remote: 
> remote: Exception 'CommandError' raised. Please report this as a bug to
> remote: https://github.com/git-multimail/git-multimail/issues
> remote: with the information below:
> remote: 
> remote: git-multimail version 1.2.0
> remote: Python version 2.7.12 (default, Nov 19 2016, 06:48:10) 
> remote: [GCC 5.4.0 20160609]
> remote: Traceback (most recent call last):
> remote:   File "/home/git/bin/git_multimail.py", line 3729, in main
> remote:     run_as_post_receive_hook(environment, mailer)
> remote:   File "/home/git/bin/git_multimail.py", line 3386, in run_as_post_receive_hook
> remote:     push.send_emails(mailer, body_filter=environment.filter_body)
> remote:   File "/home/git/bin/git_multimail.py", line 3332, in send_emails
> remote:     change.recipients,
> remote:   File "/home/git/bin/git_multimail.py", line 1883, in send
> remote:     raise CommandError(self.command, retcode)
> remote: CommandError: Command "/usr/sbin/sendmail -oi -t" failed with retcode 1
> To git.openembedded.org:meta-openembedded
>    0d27137f0..57115ebc1  master-next -> master-next
I'm adding a temporary repo to test this before having you test again
since the issues are extensive. I'll follow up shortly.
>
>> On Thu, Feb 23, 2017 at 12:06 AM, Michael Halstead <
>> mhalstead@linuxfoundation.org> wrote:
>>
>>> The hooks are repaired and need testing. (Bad git/config settings.) Please
>>> feel free to resubmit patches. Let me know if they do not appear in
>>> patchwork.
>>> I'm trying to see if I can automatically resend the missed patches and
>>> mark them superseded if needed. I'll update post here if it works.
>>>
>>>
>>>
>>> On 02/22/2017 01:32 PM, Martin Jansa wrote:
>>>
>>> 1) Make sure they aren't already in master (or master-next), currently
>>> there is only one change in master-next:
>>> eb7979113 netcat-openbsd: fix implicit dependency on pkg-config
>>>
>>> 2) Make sure there weren't some negative feedback comments on our change
>>>
>>> 3) Make sure the change made it to patchwork, currently there is only
>>> one "open" change:https://patchwork.openembedded.org/patch/137499/
>>>
>>> Be aware that the changes are usually daily marked as archived, when
>>> they are sorted to corresponding bundles and included in master-next
>>> branch for testing, as described here:http://www.openembedded.org/wiki/Patchwork#Multiple_layers_sharing_the_same_oe_project_on_patchwork
>>>
>>> I'm writing this, because currently many changes are missing on patchwork,
>>> because of some unknown issue with it, see:http://lists.openembedded.org/pipermail/openembedded-devel/2017-February/111467.html
>>> once this issue is resolved, please re-send missing changes.
>>>
>>> Regards,
>>>
>>>
>>>
>>>
>>> --
>>> Michael Halstead
>>> Linux Foundation / SysAdmin
>>>
>>>

-- 
Michael Halstead
Linux Foundation / SysAdmin


