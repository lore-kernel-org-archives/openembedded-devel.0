Return-Path: <peteasa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7D5A4606BF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2016 19:40:57 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id o80so31476754wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2016 12:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:subject:to:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=80LFfuD2ePOFU04VcAQcA3KJmtPCPY7W9YRcQ1nYM/s=;
	b=1EyZshaFNOeswQMr4N+718sAITwCU8hUx+nvtK8ng9MIguGsqJrYqQ+MWrxhSIkhGc
	yIqBMdv9Cz44xdPxCIojMma2KCxHBBjkxSikK2pUjEPQYuRJj8rKEVikXPZQnSRfpEk/
	J3CyivRJaOBTschYx2c7e/soy+YywckfKawhNArCbInMAv5DiTgtAuQ8ZziLrtQIB2/N
	Sl1BWqU/y5Q3FmFb4T/+Yow6E7G10Tllr14kWlgUfzgBd0nu94aXer+3yniFodjp1u7V
	jeLo0SatWw4G8JRxvySWcTMdPlY3lCUCSLdr5/W+p9xZ0so/iKUfrJU+y7xqguiazsNL
	uvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:subject:to:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=80LFfuD2ePOFU04VcAQcA3KJmtPCPY7W9YRcQ1nYM/s=;
	b=ELGheUo9RqzlWz9g4cJDhiSy26IFbNmuzqSBnJMhFyT6Dmvo16WglBsNskXykiZX1v
	jiAst8dm2KSmsFrqPZFnzKZN2jVuiakDrZ3p6uX8OFxYEKn/dNDJ005zLZ+XHNXGoxom
	s9QfSPrYQt5eQ+wJZyjict3mKHhU4CHBcBbK77Y/gF83vInVqfgX4TqAcxNHxZ+6JNba
	tEjDozYsfdeTwhu+LuiWpMtfLicEw6QMeEJyKU4YclJIn3SXS2FDtFsBXq0URBU0zYck
	/5B/iGUMrAEnAzxpKgud6SRKN8gyZOuF3HcPWGwjSpeAMi2FG/jgDs1aXbnfTQrnDwe7
	Mguw==
X-Gm-Message-State: AEkooutQRO9y6pE4QT51dQD+5HmQzjhecVEfh90T0Tl92XOLHZKND95JMSx+1nIwfLM4aQ==
X-Received: by 10.28.39.133 with SMTP id n127mr28040293wmn.6.1469562057403;
	Tue, 26 Jul 2016 12:40:57 -0700 (PDT)
Received: from [192.169.0.118]
	(cpc26-heme10-2-0-cust765.9-1.cable.virginm.net. [86.3.58.254])
	by smtp.googlemail.com with ESMTPSA id
	r16sm34509363wme.16.2016.07.26.12.40.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Jul 2016 12:40:56 -0700 (PDT)
From: Peter Saunderson <peteasa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <a0077818-58b3-bad2-3940-924b1df7afd7@gmail.com>
Date: Tue, 26 Jul 2016 20:40:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
Subject: meta-epiphany and meta-exotic layers waiting for approval
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
X-List-Received-Date: Tue, 26 Jul 2016 19:40:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I have just submitted two new layers for approval:

The meta-exotic layer provides a generic method of creating the set of 
tools needed to support a Microcontroller or other secondary processor 
in the Yocto environment.

The meta-epiphany layer uses the meta-exotic layer to create the tools 
needed to support the Epiphany (http://www.adapteva.com/epiphanyiii/) 
processor in an Arm based linux environment.

Peter.


