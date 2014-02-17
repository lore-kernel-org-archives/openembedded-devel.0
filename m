Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-ve0-f176.google.com (mail-ve0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 09A5B6E786
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 23:00:19 +0000 (UTC)
Received: by mail-ve0-f176.google.com with SMTP id jx11so5451459veb.21
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 15:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=7zXpexRaw8lud8Z+IXL8HWymiyWuphh6vs9UBN65cpU=;
	b=W3ZEiNoFXVIZh4dSeFcuYtkl7Oo++te5R1TVP37yntLKzwWS5PWSGpFPUbjUxNAN8U
	4JHSJv6A6plGy4nF1paXsnrWHyDboz/+B1YXtnak/I1/SuA+WlGFXiQg6EpEy5AUELn0
	01zFKSwR9rU0VIHadTT5xufK0wyeyXb4BgPx603dfP1+ds+7Y5QrDXMZ/lj2esUtcMqt
	rsFkKOUAWpMhxuHq9HQ88z1VWkx5YMCCLayWRq52TRBS7HgNzGGqO7OShwDV7WBW8LDp
	GuGNfj9s1a3slh9pb3tLWy3qTEyiChvDs9js1FuK6vGmQKUuYRSmTiFyyuoKcA/8Jqsf
	Dvmg==
MIME-Version: 1.0
X-Received: by 10.52.168.39 with SMTP id zt7mr2526318vdb.42.1392678020046;
	Mon, 17 Feb 2014 15:00:20 -0800 (PST)
Received: by 10.52.169.99 with HTTP; Mon, 17 Feb 2014 15:00:20 -0800 (PST)
Date: Mon, 17 Feb 2014 15:00:20 -0800
Message-ID: <CAFeBWL67tUiY5BZ6Fp6dz5H00Y=smW+fvdS6dzz3A0scqaysuQ@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: pam_gnome_keyring.so not getting packaged into my rootfs
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
X-List-Received-Date: Mon, 17 Feb 2014 23:00:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello everyone, my gdm logs in /var/log/gdm is complaining about these
missing files:

- polkit-gnome-authentication-agent-1
- ck-get-x11-display-device
- pam_gnome_keyring.so

The first two files are found in paths GDM wasn't aware of, so all I had to
do was create symbolic links to
/usr/lib/gdm/{polkit-gnome-authentication-agent-1,
ck-get-x11-display-device}.

The last file, pam_gnome_keyring.so, is not in my rootfs. The file gets
generated and it's in my build directory however. I can create a bbappend
to install this shared object into the rootfs, but I wanted to ask in the
list to see if I missed something obvious.

Thank you for your help!

Adam

