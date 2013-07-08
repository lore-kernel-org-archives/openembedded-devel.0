Return-Path: <net147@gmail.com>
Received: from mail-vb0-f51.google.com (mail-vb0-f51.google.com
	[209.85.212.51])
	by mail.openembedded.org (Postfix) with ESMTP id 31A466B097
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2013 07:48:44 +0000 (UTC)
Received: by mail-vb0-f51.google.com with SMTP id x17so3122799vbf.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jul 2013 00:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=LerMUjHj5gf/twRe3KsdtSpqFh1PbbrnZa/ye57owrk=;
	b=iDzxTYPr/X1SRtj1l5sSv7ZCfuGtkLlpfP1f4m5TaYBk3E5Q2txOaP61IH4fZm0aAH
	D6zl1OwCzgxGo7eOWD6t1Pp4dkMZVN2bjkx/R+yBBpOniUNgGlz3NyUdH4Dcz6GBxYDd
	WWdPW0WSoSA+SIjjeHu90eiBUo4fypFD8KwB9mkOqmb0t4lhovciKHhcJRf1qFiK0je1
	zvGfRkdoO/uTx7f6ttQpDPq1SRYmUdf1JN4Gmfhwn9Vxzb7hkiY6VV+dWUswzXIUU3/j
	w9QZj/iMRyjhuPEqG3JBapJeH8vNQds3f85w2FLV+GnXglPo9q6WCRld5aqAQoItWwKM
	YUuQ==
MIME-Version: 1.0
X-Received: by 10.52.21.196 with SMTP id x4mr2628792vde.65.1373269724396; Mon,
	08 Jul 2013 00:48:44 -0700 (PDT)
Received: by 10.58.68.170 with HTTP; Mon, 8 Jul 2013 00:48:44 -0700 (PDT)
In-Reply-To: <094610E5-4BD6-445D-B46F-B09BA052A81F@gmail.com>
References: <1373261850-3744-1-git-send-email-net147@gmail.com>
	<094610E5-4BD6-445D-B46F-B09BA052A81F@gmail.com>
Date: Mon, 8 Jul 2013 17:48:44 +1000
Message-ID: <CANwerB3Ay3UWzVeg2q67eTg12uY4FG2nUkNnqdXbYTL-JE8kPA@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Mon, 08 Jul 2013 07:48:45 -0000
Content-Type: text/plain; charset=UTF-8

On 8 July 2013 15:53, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Jul 7, 2013, at 10:37 PM, Jonathan Liu <net147@gmail.com> wrote:
>
>> The /var/lock and /var/run directories are already created by
>> base-files.
>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>> meta-oe/recipes-connectivity/samba/samba_3.6.8.bb | 6 ++++++
>> 1 file changed, 6 insertions(+)
>>
>> diff --git a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
>> index a27a28c..255c0b4 100644
>> --- a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
>> +++ b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
>> @@ -57,3 +57,9 @@ do_configure() {
>> do_compile () {
>>     base_do_compile
>> }
>> +
>> +do_install_append() {
>> +    rmdir "${D}${localstatedir}/lock"
>> +    rmdir "${D}${localstatedir}/run"
>> +    rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
>
> what is this last rmdir doing ?
It will remove the /var directory only if it is empty. In case there
is nothing else in /var it's useless to have an empty /var directory.

Regards,
Jonathan

>
>
>> +}
>> --
>> 1.8.3.2
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

