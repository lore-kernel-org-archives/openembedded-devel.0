Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9ED3972EB0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 09:18:39 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id y139-v6so1127416wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 02:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=1whJwiuqvVUITo1TJo8dskkYQEp6V5PTMt3R2RqN/Hw=;
	b=Tc+a3HHXOQW8n8qSlnehgdAX8iVhKjVuMyyWO4kiofrzY/W2uu5JlZ6pNpSlGyleQL
	07k0Ale+Av4ydgzfrWjyugwDW7EubTyXjMzId8mv6DhvosQTROtz1CjYkVO3W/PGMrS3
	Im9SOD7JwJYfzIPZjAeskavy+hmimUCIxeJRrcb+epvwAKHeWfwFTiXtUeFmgaQDfLIT
	H3IhF+ZUNx/NoxWVbfVLNhu/D08IolrxkwxUK5IBKHDAPHoWFmUllP+/3ajoZkQuo71j
	YvBnsaJURMxZZ2QevJODas6zDgFWz160K5jY2FbvxfcITlscSD75CPSfrxASgTpsEojh
	Yf4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=1whJwiuqvVUITo1TJo8dskkYQEp6V5PTMt3R2RqN/Hw=;
	b=egZtwJLV8Xe+sYaNEc1+I8pNq/4tgWgGaZYKMh2dpSPBQWHmp6hs6qgpnwWCiVBT9V
	06dpd2+PjmJrvAZbCdVtxFqhKlfE83roFkAKsMmcfdLmgJ5jzZP7z+w0TYB13JlO97nr
	UWnsjyH/AOUw11OUQhOug3Gsmsaj2NDxPwMTuPTQB2GbYJ12vQb10z5kEehmrPGbBGg4
	ZH1UukwiJBvWJPM79wlQ8gf3/2b00gijZoFOH6HTzPUTmCXfQ9Wg1G2fecwvK8Lxq77m
	qQNq5rFjtLS5yPZ6ZoYLJaqF/p2Ykfy9VKUEiovVmWz1RTPK2pJuQf+bzEBtt6xAJGJI
	xRPA==
X-Gm-Message-State: APzg51DAyj/AE//ZU+JOLXntTPhuzoFIL20wsyLcttdEI+/yJEAuY+7Q
	9Yy83Yw1+1dEOxCFjmA6ZwX0pqNUuErpaXoWtbY=
X-Google-Smtp-Source: ANB0VdYA6dt7dlTZo8yyNwC4oDOQZieoQaGRT9R96R6lxFdk3UtSpX/sFdLqVbGekRCdVlLyxtOoq0rKoTnj6ZiGomU=
X-Received: by 2002:a1c:c44a:: with SMTP id u71-v6mr758058wmf.43.1535447920306;
	Tue, 28 Aug 2018 02:18:40 -0700 (PDT)
MIME-Version: 1.0
Sender: rehsack@gmail.com
Received: by 2002:a5d:6511:0:0:0:0:0 with HTTP; Tue, 28 Aug 2018 02:18:39
	-0700 (PDT)
In-Reply-To: <CAMKF1sqWwxHF0rU8AxYM=Uz2zqjBJN_wd7fxyDyMX3Ur03zDZg@mail.gmail.com>
References: <20180827105403.6207-1-sno@netbsd.org>
	<CAMKF1sqWwxHF0rU8AxYM=Uz2zqjBJN_wd7fxyDyMX3Ur03zDZg@mail.gmail.com>
From: Jens Rehsack <sno@netbsd.org>
Date: Tue, 28 Aug 2018 11:18:39 +0200
X-Google-Sender-Auth: en5L6WM51DHr23C_SMjXmrXURpg
Message-ID: <CAANR1XEgJKEZv+CTRGFcWf0mw0oN=kPMw8Bt-toZAmcLNRF7DQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] grpc: update from 1.8.5 -> 1.14.1
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
X-List-Received-Date: Tue, 28 Aug 2018 09:18:39 -0000
Content-Type: text/plain; charset="UTF-8"

2018-08-27 18:17 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
>> +FILES_${PN}-dev_append += "${bindir}/*"
>> +FILES_${PN}-dev_append += "${libdir}/cmake/${PN}"
>
> We can just use FILES_${PN}-dev +=

Yes, the _append and the += are doubled. I'm fixing that and send again ;)

