Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9AB617806D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2018 17:03:09 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id z197so12753589qkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Mar 2018 09:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=ZoEBI3gIa+KgZv9Ws2BRzeAgGljNFpgqU6nTD7Y9vM4=;
	b=EgmWjngg1z9zAnwGrr8nX56qTVA8i/tLtlWmFnK2ZaNH/0XlJaobayR28LSzq3wZCO
	jYv92lkz8rqxnoN4b3GWRLb8Rq6aMCh9V9S51cx8Ze4DoSAdDbOF5DRkIikjFsgxBpVm
	GyDMcJSDYeBxg2/DLlIxR1oubM88U1kInVdmuz7moZldB1m99rIyEh+3PrR1PGK7vUig
	ERXkvNdqhPgo5b6+3oyD1F5ACV80iBJpYyJdJzJR/z1RUEbSMhKE53E35eH/S8nylL+x
	J26DC3I35RxWDnqpOoNWpZ5nF0LLlUQxWEgUxvvFNwWnQK0D2osSAX/lOKN4mqEWrfn3
	LmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=ZoEBI3gIa+KgZv9Ws2BRzeAgGljNFpgqU6nTD7Y9vM4=;
	b=pI+y/G1tG8Nq+d7oHpjbmuBhpk0t7+0i5PCTyVnL8mi6lKJsxmegeGBlz648Ekjxgx
	WZFT2AZ03qXkc36nu5AROpl0tzHV6n3YmNb1V4o+d7rpPn0hFPH0f3e0BJvQm3Rd4IP7
	noVrkvPaVkYE+Jdd3DsiKJcU9bVwZJ5v2o0AzvmIuEv2M0GqDXvZU/+FvKVo+8AXFFl1
	YeSQgBzUmVYTB64OBKNMzUmpozQ34iDdFR4Tj09ZofB56Mvnl8Xn5GZ/H9zNgiIHfK4H
	ZtEuuA8fbL9ETCFVFKxDjRYVz0osVh0FrDdHgsENPvVPe6zGa+OQ6YjhPg0l6Ka5qG2E
	Tkbg==
X-Gm-Message-State: AElRT7EY4GwQbs2IttiaVcvyzndB+evBO5IaKlNuvvoCOUtTiY1uioAg
	PuyLLjK5iEFe543hJI0iGsArXp2U
X-Google-Smtp-Source: AG47ELvdJ/ZI9KBpycIvj/Pygnz8sWdaFVYqHcpH4+M2TdnlYEmPBaHnEcJQaHwJeRGAcC1E0QtkNQ==
X-Received: by 10.55.41.92 with SMTP id p89mr9224468qkh.208.1520010190523;
	Fri, 02 Mar 2018 09:03:10 -0800 (PST)
Received: from mbedesk.sonatest.net
	(ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
	[174.94.156.236])
	by smtp.gmail.com with ESMTPSA id a79sm2201725qkg.4.2018.03.02.09.03.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 02 Mar 2018 09:03:10 -0800 (PST)
Date: Fri, 2 Mar 2018 12:03:08 -0500
From: Maxime Roussin-Belanger <maxime.roussinbelanger@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20180302170307.jmf5hyru6lwv6kjq@mbedesk.sonatest.net>
MIME-Version: 1.0
User-Agent: NeoMutt/20170113 (1.7.2)
Subject: meta-python/python-matplotlib
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
X-List-Received-Date: Fri, 02 Mar 2018 17:03:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

When I run matplotlib in a genericx86-64 image it's missing the dependency, 
python-cycler.

I patch that dependency, and then run it again with

"
python
import matplotlib.plot as plt
"

Now I get another missing dependency "Cannot import name '_path'"

I've tried to make it work, but alas. Have any other developers encountered 
this problem?

Is it a problem with the recipe itself?

Thanks,
Max


