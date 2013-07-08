Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id B29926B045
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2013 13:52:02 +0000 (UTC)
Received: by mail-ie0-f178.google.com with SMTP id u16so10302877iet.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jul 2013 06:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=4cz+pImNgP6yUOHdZR7joUsn9ouUBTXddBkdodBDMIY=;
	b=MLRZdFOXZV8cI59FuaCrZ74hCf58jDjcFuS5FaBgGIB7yD0+uOZQyul6YubJxaa4gI
	ZOWpMhSwTd6dGjOyhIRSKS4tny8le9NVkPPRD8G4j7d2+r5UvdmP7u/lG5ma9bKhrw9c
	VyyetliS6C5hjps34R9sPvISdzOIXlOgSXd+K6xo0TA4POsRr5KPr4GQXLHZbK9wMjPQ
	yPBkcG+fjKmXz+jjqR4il+CtuqSnDjD6pz/heRQ1VHAr00AvLx+70zetoUOJStQBt0pO
	CM+17A4cL3WaKCDueiWFtPBS2qTD7qA9RAITvl/0veMqZjJ5RqqdAqDGweH/SfF1peZ5
	53qQ==
MIME-Version: 1.0
X-Received: by 10.50.77.80 with SMTP id q16mr32510599igw.3.1373291523403; Mon,
	08 Jul 2013 06:52:03 -0700 (PDT)
Received: by 10.50.4.168 with HTTP; Mon, 8 Jul 2013 06:52:03 -0700 (PDT)
In-Reply-To: <CANwerB3Ay3UWzVeg2q67eTg12uY4FG2nUkNnqdXbYTL-JE8kPA@mail.gmail.com>
References: <1373261850-3744-1-git-send-email-net147@gmail.com>
	<094610E5-4BD6-445D-B46F-B09BA052A81F@gmail.com>
	<CANwerB3Ay3UWzVeg2q67eTg12uY4FG2nUkNnqdXbYTL-JE8kPA@mail.gmail.com>
Date: Mon, 8 Jul 2013 06:52:03 -0700
Message-ID: <CAMKF1sr+4dzjZFJybXOd5RM1aTE6MEHj0k=rjUaoYLsrOa1Kkg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH v2] samba: remove /var/lock and /var/run from package
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
X-List-Received-Date: Mon, 08 Jul 2013 13:52:02 -0000
Content-Type: text/plain; charset=UTF-8

On Monday, July 8, 2013, Jonathan Liu <net147@gmail.com> wrote:
> On 8 July 2013 15:53, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Jul 7, 2013, at 10:37 PM, Jonathan Liu <net147@gmail.com> wrote:
>>
>>> The /var/lock and /var/run directories are already created by
>>> base-files.
>>>
>>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>>> ---
>>> meta-oe/recipes-connectivity/samba/samba_3.6.8.bb | 6 ++++++
>>> 1 file changed, 6 insertions(+)
>>>
>>> diff --git a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bbb/meta-oe/recipes-connectivity/samba/
samba_3.6.8.bb
>>> index a27a28c..255c0b4 100644
>>> --- a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
>>> +++ b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
>>> @@ -57,3 +57,9 @@ do_configure() {
>>> do_compile () {
>>>     base_do_compile
>>> }
>>> +
>>> +do_install_append() {
>>> +    rmdir "${D}${localstatedir}/lock"
>>> +    rmdir "${D}${localstatedir}/run"
>>> +    rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
>>
>> what is this last rmdir doing ?
> It will remove the /var directory only if it is empty. In case there
> is nothing else in /var it's useless to have an empty /var directory.
>

Good. Mention it in commit message

> Regards,
> Jonathan
>
>>
>>
>>> +}
>>> --
>>> 1.8.3.2
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

