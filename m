Return-Path: <joe@deserted.net>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1C45B6156C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2013 01:22:17 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id u16so5246463iet.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Sep 2013 18:22:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=Oy5Hzv8ed/LYIYCCHbvG8tT4p/zSDN3DrROhuwumloo=;
	b=ZHryBhRQ21qRXeawVApWSFR9U97hGaFuZWCtwkAjDru5HhHM3vhUhsfllpi+xXzY98
	CRnmMPuNtj8jqDfGr3dQfnNObroALRmOfLtTPweR2YEGX4aEmP3KxqmVhl3e8XfCowuW
	WSLJiYqhUQsCSI3kvBTBeCUxkd+xsfZiFmLH1ZiJ6HvP0l8FHmvjJmfvGT+mcfAC1Lse
	Qoy5Tvy/tHGLuhiBIYnSeLMp5zWoAQq0Sd6xI2zKae1ZVKlutN2m6yfmHePDzckZ3KzL
	UwIhIwEi5KNJZQROoVLirWoXwvBSeqi1nRDLIErystiI94UotORXXWb5tUF30WRtEmk9
	9J2g==
X-Gm-Message-State: ALoCoQnq3H11xkS83tKAD1s5IczQD1BlLlci9cKXOvYzJ1JkhJIvelnLm7AJk491TTBjjRAxFtVI
MIME-Version: 1.0
X-Received: by 10.50.111.197 with SMTP id ik5mr8261991igb.19.1378430538678;
	Thu, 05 Sep 2013 18:22:18 -0700 (PDT)
Sender: joe@deserted.net
Received: by 10.42.152.71 with HTTP; Thu, 5 Sep 2013 18:22:18 -0700 (PDT)
In-Reply-To: <52291EE4.9060306@windriver.com>
References: <1376981857-9687-1-git-send-email-rongqing.li@windriver.com>
	<52291EE4.9060306@windriver.com>
Date: Thu, 5 Sep 2013 21:22:18 -0400
X-Google-Sender-Auth: kYSCC4aP1RnO6t6QPHnEZOTTPjI
Message-ID: <CANBf+V3y9hc-2xWi4moSgSOpyQt5rY+f3dZENJGgZrQnji95ZQ@mail.gmail.com>
From: Joe MacDonald <joe.macdonald@windriver.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH meta-networking] atftp: port a patch from OpenSUSE to fix "Sorcerer's Apprentice Syndrome"(SAS)
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
X-List-Received-Date: Fri, 06 Sep 2013 01:22:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Sep 5, 2013 at 8:16 PM, Rongqing Li <rongqing.li@windriver.com> wrote:
> ping...

http://git.openembedded.org/meta-openembedded/commit/?id=2b5682418cdec33f91e6fc3545e7dfcea57de4c7

I do think that some of my mail wasn't going out earlier today, though
and I don't see anything in the archives showing my 'merged' reply to
you.

It's there, anyway.  Thanks Roy.
-J.

>
> Thanks
>
> -Roy
>
>
>
> On 08/20/2013 02:57 PM, rongqing.li@windriver.com wrote:
>>
>> From: "Roy.Li" <rongqing.li@windriver.com>
>>
>> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>> ---
>>   meta-networking/recipes-daemons/atftp/atftp_git.bb |    1 +
>>   .../files/atftp-0.7-sorcerers_apprentice.patch     |   94
>> ++++++++++++++++++++
>>   2 files changed, 95 insertions(+)
>>   create mode 100644
>> meta-networking/recipes-daemons/atftp/files/atftp-0.7-sorcerers_apprentice.patch
>>
>> diff --git a/meta-networking/recipes-daemons/atftp/atftp_git.bb
>> b/meta-networking/recipes-daemons/atftp/atftp_git.bb
>> index 4b9ff05..8f9b4e3 100644
>> --- a/meta-networking/recipes-daemons/atftp/atftp_git.bb
>> +++ b/meta-networking/recipes-daemons/atftp/atftp_git.bb
>> @@ -13,6 +13,7 @@ SRC_URI =
>> "git://atftp.git.sourceforge.net/gitroot/atftp/atftp;protocol=git \
>>              file://atftpd-0.7_unprotected_assignments_crash.patch \
>>              file://atftpd.init \
>>              file://atftpd.service \
>> +           file://atftp-0.7-sorcerers_apprentice.patch \
>>   "
>>   S = "${WORKDIR}/git"
>>
>> diff --git
>> a/meta-networking/recipes-daemons/atftp/files/atftp-0.7-sorcerers_apprentice.patch
>> b/meta-networking/recipes-daemons/atftp/files/atftp-0.7-sorcerers_apprentice.patch
>> new file mode 100644
>> index 0000000..fc64291
>> --- /dev/null
>> +++
>> b/meta-networking/recipes-daemons/atftp/files/atftp-0.7-sorcerers_apprentice.patch
>> @@ -0,0 +1,94 @@
>> +atftp exhibits the well known "Sorcerer's Apprentice Syndrome"(SAS)
>> problem.
>> +According to RFC 1350, the fix to SAS is quite simple: further copies of
>> the
>> +acknowledgment for a particular data block would be ignored.
>> +
>> +Patch originally from OpenSUSE:
>>
>> +https://build.opensuse.org/package/view_file?file=atftp-0.7-sorcerers_apprentice.patch&package=atftp.539&project=openSUSE%3A12.1%3AUpdate&rev=84569792975e00573d7df597d2a6e895
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>> +Index: atftp-0.7/tftp_file.c
>> +===================================================================
>> +--- atftp-0.7.orig/tftp_file.c 2011-11-22 15:12:53.792744083 +0100
>> ++++ atftp-0.7/tftp_file.c      2011-11-22 15:13:51.706421893 +0100
>> +@@ -605,6 +605,7 @@
>> +      int timeout_state = state; /* what state should we go on when
>> timeout */
>> +      int result;
>> +      long block_number = 0;
>> ++     long last_requested_block = -1;
>> +      long last_block = -1;
>> +      int data_size;             /* size of data received */
>> +      int sockfd = data->sockfd; /* just to simplify calls */
>> +@@ -765,6 +766,17 @@
>> +                          connected = 1;
>> +                     }
>> +                     block_number = ntohs(tftphdr->th_block);
>> ++
>> ++                    if (last_requested_block >= block_number)
>> ++                    {
>> ++                        if (data->trace)
>> ++                            fprintf(stderr, "received duplicated ACK
>> <block: %ld >= %ld>\n",
>> ++                                    last_requested_block, block_number);
>> ++                        break;
>> ++                    }
>> ++                    else
>> ++                        last_requested_block = block_number;
>> ++
>> +                     if (data->trace)
>> +                          fprintf(stderr, "received ACK <block: %ld>\n",
>> +                                  block_number);
>> +Index: atftp-0.7/tftpd_file.c
>> +===================================================================
>> +--- atftp-0.7.orig/tftpd_file.c        2011-11-22 15:12:53.793744112
>> +0100
>> ++++ atftp-0.7/tftpd_file.c     2011-11-22 15:15:04.617534260 +0100
>> +@@ -403,6 +403,7 @@
>> +      int timeout_state = state;
>> +      int result;
>> +      long block_number = 0;
>> ++     long last_requested_block = -1;
>> +      long last_block = -1;
>> +      int block_loops = 0;
>> +      int data_size;
>> +@@ -859,6 +860,32 @@
>> +                     {
>> +                          logger(LOG_DEBUG, "received ACK <block: %d>",
>> block_number);
>> +                     }
>> ++
>> ++                  /* check whether the block request isn't already
>> fulfilled */
>> ++
>> ++                    /* multicast, block numbers could contain gaps */
>> ++                    if (multicast) {
>> ++                        if (last_requested_block >= block_number)
>> ++                        {
>> ++                            if (data->trace)
>> ++                                logger(LOG_DEBUG, "received duplicated
>> ACK <block: %d >= %d>", last_requested_block, block_number);
>> ++                            break;
>> ++                        }
>> ++                        else
>> ++                            last_requested_block = block_number;
>> ++                    /* unicast, blocks should be requested one after
>> another */
>> ++                  } else {
>> ++                        if (last_requested_block + 1 != block_number &&
>> last_requested_block != -1)
>> ++                        {
>> ++                            if (data->trace)
>> ++                                logger(LOG_DEBUG, "received out of order
>> ACK <block: %d != %d>", last_requested_block + 1, block_number);
>> ++                            break;
>> ++                        }
>> ++                        else
>> ++                            last_requested_block = block_number;
>> ++                    }
>> ++
>> ++
>> +                     if (ntohs(tftphdr->th_block) == 65535)
>> +                     {
>> +                          block_loops++;
>> +@@ -958,6 +985,8 @@
>> +                          /* nedd to send an oack to that client */
>> +                          state = S_SEND_OACK;
>> +                          fseek(fp, 0, SEEK_SET);
>> ++                       /* reset the last block received counter */
>> ++                       last_requested_block = -1;
>> +                     }
>> +                     else
>> +                     {
>>
>
> --
> Best Reagrds,
> Roy | RongQing Li
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

