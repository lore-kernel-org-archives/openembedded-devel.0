Return-Path: <cliff.brake@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id EB6E6605BA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Apr 2016 19:09:55 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id p64so8416491lfg.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Apr 2016 12:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc; bh=0YN+yQhhzPk1LCXlCuxcUOuelUmnVD0KLPzL1bQKZzo=;
	b=memEbSuZRVAAB5uylms1kMyenEEjZpl+5H9Fd2FZh2yYF8KFVNdcn7nTNt4opWf3+F
	ot6w3t6odMIomMK8GVxMKaUwqTB2uvVS2ReVpxiEliQ/drqqkTd7xURpe8zbfYhfRgho
	BiInHNCjZL8MMYr7H66WmqisKloPPLPQhRWjJQNdbxVd8PmLDz6JAbbp/0JccoRFqPJs
	z+PckY1olTPC118Jnq79et1Y/Mzm8qoGBORVa8msHilodjFEa3IQj2r2WGb/fCbaSn6V
	A3AdzI+I09y5Rvi2HHUqP+9j/Z21BedeiSRd8WqSEaVv+iLL1lJlG+7aT9iJ8fgGGyzO
	9o9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=0YN+yQhhzPk1LCXlCuxcUOuelUmnVD0KLPzL1bQKZzo=;
	b=RkkJqiDFkAiBxaWq0pnXY1BtaYYLK2qRjFypsI7JgIPO7/ekMTNS4O1u21lsI+wN6i
	QtCOPCiPhpVWsN36br8/m9tinma0h7djL0GcxKc63DJS1+dOucFnueCdtRTiHwruXjMH
	EVkckHryOoMfGHl/1HztKIMpwTTIHzrxFRYkRKyg6TEoFO+vft8+SjiP3xjaDT8V8y9r
	ZOHAdKuz//KKZec/bM9aZnTCN+v4HtNMiigDu6iY/DWbJU+5y9rKMKmXszbPZTS8Cd8j
	PHHX/DCAq2fn19Y6+SdJcxi/ZCf32+fwBoMacoa7o84otu49kB0G9t90uW8xsAutXXL8
	r3cQ==
X-Gm-Message-State: AOPr4FVDJ7oanRRy9ynFpxDJYG/5OH30NVrMyRNY6R/j7J4CAOcC1XO3+J1XAm6NE/sr/3FjQP5o6iIaGUTEng==
MIME-Version: 1.0
X-Received: by 10.25.208.80 with SMTP id h77mr7375035lfg.11.1461265795689;
	Thu, 21 Apr 2016 12:09:55 -0700 (PDT)
Sender: cliff.brake@gmail.com
Received: by 10.112.181.105 with HTTP; Thu, 21 Apr 2016 12:09:55 -0700 (PDT)
In-Reply-To: <CAP9ODKocX2ZV8SgatTYx6RhYfzngn_g6U7_Fq+jQHcHz7pYVgg@mail.gmail.com>
References: <CAOd_LFyF5A_Xp5SGVM7cQXU=w3zhPeWsWVohb2V9VDVxMLwoTA@mail.gmail.com>
	<CAP9ODKrgiJvzB5NaH6GD2Sv8nt9nKAy=1kHzYXULQDLA9hd0_Q@mail.gmail.com>
	<CAP9ODKocX2ZV8SgatTYx6RhYfzngn_g6U7_Fq+jQHcHz7pYVgg@mail.gmail.com>
Date: Thu, 21 Apr 2016 15:09:55 -0400
X-Google-Sender-Auth: DtsWGbC9Uxhv623IhJCunQ0P0lg
Message-ID: <CAOd_LFx1kY4d6Gt=obRY3qf3gRD_SYbmrY+-Pw-yinbA85cE8w@mail.gmail.com>
From: Cliff Brake <cbrake@bec-systems.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: anyone using docker for OE builds?
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
X-List-Received-Date: Thu, 21 Apr 2016 19:09:57 -0000
Content-Type: text/plain; charset=UTF-8

Thanks for all the information.

After a week or so experimenting with Docker, I've come up with a
solution I like:

https://hub.docker.com/r/cbrake/oe-build/

Also wrote about it here:

http://bec-systems.com/site/1281/using-docker-for-oeyocto-builds

Thanks,
Cliff

