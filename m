Return-Path: <oosaprogrammer@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id B86286F92A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 06:07:00 +0000 (UTC)
Received: by mail-ie0-f170.google.com with SMTP id rd18so8765392iec.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2014 23:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=AJwz8U/RdhHD9lLQOkKKWoHWD5TRVdxbj/eyaMIRRu0=;
	b=aNb3wPG+6XtWfcU29oUV6vKBApPcAFJEkcE6qaZ47iufxbu8FvceNPttbPt/b3qztJ
	NTyvyxLqBB6RmLiUHSOFMT5PDh5Vl6WhdsZV1swmBi5Na3h38//RzFOn8+MEpRuuSsX1
	1b9DM/lV7gOVOgXkBpq0MKFlSSqH/Ey/Sk+C2iSHDmAOvqq8RAwbuMNiTYqHAzJgN/QL
	Cele8A6SpPzmZMACfW5ZbitAApGQqW73bJBjNWgV9aO5cHQ9ITV5v/NKHanQMRq/iUkC
	PFuaGyNliJLacRjgDVAJPfO0Az1boBzerc78RyN5v4r+S4ieOvlvZkKdUqyZb0bmOQ9s
	wW2Q==
MIME-Version: 1.0
X-Received: by 10.42.200.7 with SMTP id eu7mr33913360icb.47.1396332421308;
	Mon, 31 Mar 2014 23:07:01 -0700 (PDT)
Received: by 10.64.230.100 with HTTP; Mon, 31 Mar 2014 23:07:01 -0700 (PDT)
Date: Tue, 1 Apr 2014 15:07:01 +0900
Message-ID: <CALYKT1hK8DF=kt9k_0bMjn4_nZGTMb=hakdTpUVObgdBJ1NhWQ@mail.gmail.com>
From: "Journeyer J. Joh" <oosaprogrammer@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: How can I make my own program start up when my system boots up?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Apr 2014 06:07:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I'd like to know how I can make my application run during the system
boot-up.
The system I use is based on Qualcomm's LTE chipset - composed of MDM core
+ AP core.
The system on AP core is openembedded.
And I can access it's shell using adb shell on putty.

Now I'd like to know how I can make my own program starts to run during the
system's boot-up time.

I tried to add the execution command in /etc/init.d/data-init - at the very
bottom. And it worked!

But I am not sure if this method is correct or not.

I searched on internet but didn't find any good explanation for my case.

I found a pdf document [1]. And the right place I think is shown below.

8.26. Initscripts: How to handle daemons
> This section is to be completed.
> * update-rc.d class
> * sh syntax
> * stop/stop/restart params
> * samlpe/standard script?
> * volatiles


I believed this would be the one I am now trying to find but the document
remained this uncompleted.

Is my method - using /etc/init.d/data-init - a wrong approach?
Then how am I supposed to do this setting?
Do I need to use update-rc.d?

Thank you very much!!

F.Y.I, I can look at whole source code for my system. So I can change the
source code.
But the customer of ours cannot access the source code. And my question is
originally my customers question.. So I'd like to find a way which is not
related with the source code change. But if I have to, a method which let
me do what I want by changing of source code would also be welcome!

Sincerely
Journeyer


[1] https://pixhawk.ethz.ch/_media/dev/oebb/oe_manual.pdf

uname -a outputs as shown below:
Linux (none) 3.0.21+ #1 PREEMPT Fri Mar 28 15:27:51 KST 2014 armv7l
GNU/Linux
Linux version 3.0.21+ (user@system) (gcc version 4.6.3 20111117
(prerelease) (GCC) ) #1 PREEMPT Fri Mar 28 15:27:51 KST 2014



----------------------------------------
Journeyer J. Joh
o o s a p r o g r a m m e r
a t
g m a i l  d o t  c o m
----------------------------------------

