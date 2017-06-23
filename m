Return-Path: <mkelly@xevo.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0084.outbound.protection.outlook.com [104.47.40.84])
	by mail.openembedded.org (Postfix) with ESMTP id C824578212
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 23:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=prKQeU0U6bzp0NvL+0N1suRbPc4U4fp2KIEm6QfWraw=;
	b=yfbbLtOSxFFT1Fz71LXRAs66KHDc1/6WoVLyxdcArQ//McgwE9DgV6CIHWiSTqGZaDLRpuCoRzrVFjU2eYvJstgo2zPh6C7lpSAOIM/sWp6B+1TzlfS3XBBrG6OriJWdQankJ7Nq2H8FGJeTq6wUYOBl9Y2Cope+IFc7pNZMsc0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from columbia.surround.io (65.122.179.226) by
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1199.15; Fri, 23 Jun 2017 22:49:07 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Jun 2017 15:48:45 -0700
Message-Id: <c7e9f733d7c1386711d74947a1ddc20879bf4a40.1498257745.git.mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1498257745.git.mkelly@xevo.com>
References: <cover.1498257745.git.mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: CY4PR08CA0055.namprd08.prod.outlook.com (10.171.251.148) To
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6cce7d4e-b1b5-4b76-f467-08d4ba8a0e35
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500074)(300135000095)(300000501074)(300135300095)(300000502074)(300135100095)(22001)(300000503074)(300135400095)(201703131423075)(201703031133081)(300000504074)(300135200095)(300000505074)(300135600095)(300000506060)(300135500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	3:upyAJZNrNSyo348hBx3quuNpR21QfOzO2197kkUdIBYhV/m9GR0MfZIcECc7BcyI/FGlMOLUTR0jbZ40eCWrltJoUzBJwxpN0A0Bv4BfaZzf3tOyO7eIWoJPqIdTXghZ7EE38c3mugI0le06qbnuKIpnYjheXSEIe3af5GevAudaiEctxOktj/CI970AMNh+saanXlmoV8YwhDWivmHCtRpGSi8qk13QXzbo6z0A34e9F4y8HkouWtz+L/GZJ7fSYOKzNSW91Nn61rMiK70/8FK/o5mv4ZsGw800KVVn5zoBZJIx8xqxA0DP3zBQzw7UYO/wGnB4nxcI0jUfzD1yt3N7QLZw4ylXPk1uN6IB24mfHhQhMcoGqFEl8n0dRJTEsT3V6+mC8XyHt6TR+z42AjYZKHG17cNL3S2ZtJBmPc1WltvsgahqARi5YD1scfwT36Fbp6cdBFiyGOh33v/WJ0HD7v7uPd/fJry+tt+45ZLVzOhHpuwGMBULiL6asYp5aYoZ3qS+Ne/h84AIwvOI6cRSTG3HwlaUX1qQCsOTLza8z14wUMVIabVaYt3QdsDftlr5CgpyWJLKz814gBisx8tlE1spVFCys0yncX4ZToqSWPi9q0kGGGF9Kj535hpz6dgerz20fIcFMsI3+lmrBJ4wJeYCZrcp28Cg3maVFoh9oX6FBh7E5C4BTno77FEllMSHS31zY8eGGpBj1mbvt4bEIEd2Nb/VxRBDZonBNl4=
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2935:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	25:5U+Uv9gW4ez8g4rKWZVG26h0pHKRsSPkJZA1FsMdvxv4MbIYEXazUdm1LMNBDb2onyCi6k/gkYass1ytUYC9iBmtp7+S+FH1lIqGXv17ReMI0Y7uKI/cVx1pXHwzTecyB4RslSCkqEkHDL73n4JJ6o+jcFVe00DQbnLvdV+Gla25z1E/0u/vlZqHU41SMW4pPbMCet8VjMzWYPuV+hktix/ou9hNDK0aQER0uig05/9nqSS9pk7+Pt51BCf6ag02sNUtwahZgSh+DygJPFIRSHAFaJ2dgsOswTta1N7+qi4IWxi9SVsnJnwtiQDwQT1ye71xo52NXnFPCeewLMginR3+JHFnOgO8vgFOV6kg0TDo5CkWF6aYya7TdyAVOjUY/v37vRQqs2E7poafjnXrMQ+5w+iU0KuMjF9FfnbSDSt51yMPL5wovFcVl4PVa46pn0W47b+5hIdquRPoXbM4rNzW3YqazWO0lXu1J2BpjHnfcMr5UQagPFkWXZGckSnsobuabgJnWCeXCVTJy/Hp2K9jt7weGtXqVPP8yLF0CZYBZoDtdCdQP6AwmwmHzNx1r9zvrWdaSP9paNo28nkiOYJjS2nK7MlkHboaJu1lNyq2xB50KSZveiob6uJEB7YAes6sTMwmVO6KV7XHNjyv9AccquBwfmqufhhfrjaD+IRJIjXvXH2qFmk4SERnvpY92UI/S2rttK4bA2MQj6/bSK6UTLcR2zvc9p5I33mU4sLtvrfW2SMc4aixHq3FCMMHA7NfKxoxUR4Xhum5lQMWOjm45F6AuB7QBAevwWyk6bVr08m58n2VD8wbRYiW7jtfWZFGWZ6If1VFfZlxMy1O77E/a7Py6tD+BCdsYAiqQO+eD2xy+eAhjIXZCqQqWmYwwMJg675qKF1O46WlZK/+1vRz5ocd7qNSNG8kOeQXrAc=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	31:OmziJ8aJLr79gYpVvdbC5xoPjsxZQ8kcZj+0UKiE27D6O54Vx715yI2U22LKQuXSNK3mpIgE6PLbXR9K2ELAOgtKPBprqc57UUjvRy1UGdmkT9vnIMFCyxXPzwl47KscN0YajGqWe1iCndWdkRd+1r9MhzJULCaoSM/3yLJKx9HKKX2xJpQp8xazhHMlCOAwiLUm4oifC1AGuBzjGfp2jaJfg2CN6AClCPDjBvALFt4ueqf4fMadWvkOyPIEujIQfjRjNvnfNhZFILQc6WZtarc4fxDB5WokAgzRUkWi9Rqmdafo1lCU/PFPU7OYcB1XFbgZwWsivVUQsLmcnpBMOvieedk3Qmb7oHivbvRS0vc+Sk0g80sxYBNCN7EstFfKoxPBhmt89hg9zbDVUMZQl60Cd8lT0zQrWE3bJJv4edjPS7+5I0I5uD8MeKO67/8rW7kK6zvdZFTSSe49f9xPRy2Pd89xq7urBuMzdUaB94rxC11x5tgVncNj3wkHynmrvzngMB5iPf0su87EeltR/xWaqjCityDyDb7iF0H843Yat3Elbofmz8wBXWRa3jzPEd6rfIoc9hcRSWsEtgZkDmFoF4AitwfAttKp2P+fXqIv1b8rEEIYZKIpeQaQv9dJBq0MOevz3ep3xSDIFi41vI5zpSQ9n5O/6zfIRGIsbwI=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	20:3W8ylIcMIHu5Y/GNUBVIbiGfRmqCyZ6PxK6IDfubqreuOYbhHCQ2rVfZzF6t4MBYzbhv7PdlX+LYXkpldzCqb3r8HOcJA5ibgoZZf5bowvihGFsTBFWaCvsmxiHEgpQtMR/R9T/KV8GSU90sKvqnwUMy+IJEsU/11wNcSVxx455FesctMj3+gn1dDCj7b6Ql61uvGInVWBPqStY8yka/7kPxlJF9/WoFxpqimc/RheFEwy7SRbHgOjIRF3g/g3EvV2tOvOJrQ33aDhty2hf6+Is0ajqjVGoPIjU8ZPikb7/T2vLCbwVfKDDQYSQpkHT18OPlVyj+FRUmEFpwjc9QfA==
X-Microsoft-Antispam-PRVS: <CY4PR0101MB2935F81194022520B7E2CD42ABD80@CY4PR0101MB2935.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(100000703101)(100105400095)(93006095)(93001095)(10201501046)(6041248)(20161123560025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123564025)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR0101MB2935; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	4:3Cx2aqLcTUwNeKQyJY956HXxdaVO3GZhBA5v32j3?=
	=?us-ascii?Q?2DrGT3hUyp4+QT/Mb1CCqiRj6iDonB0hKhElMsipIfjK+0/tRDHDAPf0qwqE?=
	=?us-ascii?Q?124F+h3hPUX9rB9XlOj70fA+juBBK0gEvSkmw0baG6QC2+HW7AsA2OtDhHst?=
	=?us-ascii?Q?7llSWu7Kgdy5q1cxQ/JcX7XReXzna5CZ6EiThPpoFYqBqwfVY3ZfnBbAizrm?=
	=?us-ascii?Q?U98/w29coZ7BI4dcWkyYFZaaibs9zY7krvgKrrLg84T8xEdMr54rsHQdAMyl?=
	=?us-ascii?Q?U1pXl4liCFTvhIEBP+QasocoueFFy9uIwNTmFaEs2owJyRzynIqnhVRzedT6?=
	=?us-ascii?Q?uHDXEV05T5MUAz4ZlWl8YpyRxQdIVi4UlXb2YTc9XPLB8E5eL0HgfJkkEK0o?=
	=?us-ascii?Q?UREJDMtHr4VxvlD6Uc9W7WCThaQeuWU4ME6NyqcMlEwwGS6OKIy9R18tSmaA?=
	=?us-ascii?Q?uOrPZqmyuDVbUNYSzb+luAblP+95oj+k0hK9MJVaF3qgeYlI6w8/moviyMNP?=
	=?us-ascii?Q?1bEbd9cDpoEhbiILIWBkDcWnQxLST7KEJADcKS+zffHBe02KyEUbrxlO6kuc?=
	=?us-ascii?Q?/1B4sIqNUgjPpYFMCC35rXg4b5kMMt3Df5c+VxquFGomzk4LVlDrHlefyC7W?=
	=?us-ascii?Q?HRK3cQEKwNr2Q/9mirkIrmQB7UfkMWT0OH2CIrBeg/Nea9rk14aA6VGDx8f6?=
	=?us-ascii?Q?wvq4aoLbX7xib24W1jpU9JFRBdccfWXyZyoLGtFMi3j6srL0GwxLMlIBCCdJ?=
	=?us-ascii?Q?bOv50sE5Mdk6IaLzyr1UtSr9wPScr2dWnkCF21kHD9labAAjcnbMHUZZL+8V?=
	=?us-ascii?Q?H+DJpg3W1YszNFk0DG9GMqZQ4JEwfshdef/REdC+nJJwbXHKg+tZPVjLx9tz?=
	=?us-ascii?Q?KDDMEQbP6mNZMQxLCR3pcKBalzDVePSvaaqZ23ps3s6IqIjz/ASqF1336UhP?=
	=?us-ascii?Q?S4W7IucYi5qj1B/LG8Z43K/tA0H4uJZpd5kzqdBDBDabH4YXRskG8Emr3/9P?=
	=?us-ascii?Q?rm083KUxRB/wJsN3xLyo8MhqzHf3IlzVnTd1YxgbgTajqzonLZLj81Ppgbr7?=
	=?us-ascii?Q?FpMA1eNvUAnDeWJFgZQuR+/vVJF1yq151aNyMNsK5xIaZrPp7e0u9PVbcIio?=
	=?us-ascii?Q?SCxyjHK9LlzHpLE2iQWcKqNAt5knxBcV?=
X-Forefront-PRVS: 0347410860
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(39450400003)(39410400002)(39830400002)(39400400002)(5660300001)(50986999)(53936002)(33646002)(5003940100001)(76176999)(8676002)(478600001)(50226002)(42186005)(47776003)(53416004)(66066001)(6666003)(2950100002)(118296001)(6506006)(6916009)(86362001)(50466002)(189998001)(81166006)(48376002)(36756003)(4326008)(6116002)(54906002)(3846002)(25786009)(2906002)(230783001)(110136004)(6512007)(107886003)(6486002)(305945005)(38730400002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2935;
	H:columbia.surround.io; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	23:fUScpydQMujxRxUX9meufNw+gAIXt8s3SU4b8Vf?=
	=?us-ascii?Q?zU8U+gAVFvatsSUDPhSrmymyc80QC64cawNWQoJrrWc/rPvQf5nayi2iT15v?=
	=?us-ascii?Q?NjqAj4CQ9yqUqNUKi7Nu+2hBKvdGwi4kUcmLxpLongUwQJkrkqGatO5V4YKf?=
	=?us-ascii?Q?VV4BYKttfPAknvccD2O9QqxFKXa+cJgp8dMw9lrAokwTLZCxh4o/yLx/xVkY?=
	=?us-ascii?Q?qYNqOJGBy4bFP9gxlhGM1unzhXhk2SwP5fwdWk8FLXpYjSmYuyvvfZMdP1mS?=
	=?us-ascii?Q?R96W/SWBIovRGghsmUf7aBMYH+STmot5uAnf2mKN8/kTAg6sS59yS4IJwOXi?=
	=?us-ascii?Q?meziN7oF0xK4abHIO4dcH5Ij2qP7T8hTj19teqJTGbQr40t08tHWhoyDgp2S?=
	=?us-ascii?Q?2YxaBsS0087Sgc/O8v+CSn7KbcqaerAslmef1TWmpcoBSmLypdVSqP1XicWG?=
	=?us-ascii?Q?TK5TKzMoeCWeKxeq5DpnL1TWETgo7nhlpnRya5dJRNyK8NBUc6Ve93ZNahrE?=
	=?us-ascii?Q?dsVgOIqtdFEPC+FJoWEbriOBzjAyGF/pN+BTLcLbTudI4zKvVJu77P+6/W8/?=
	=?us-ascii?Q?bfc6hZoh9pwvOjjrvdhrAQDsjUZo65GVTfMFsvo8EUEyE328Srj1d225s3+O?=
	=?us-ascii?Q?jqipNRYjjV1RJEAPnJXDfdnG37KErF/+/ZbwFmxbfR/RodHwKASKPcmgwF7A?=
	=?us-ascii?Q?qUBIdEq/XL6L+zCna4llCQ3UOfdo6vbKo4uxDwSk9YJrmujlqNq2A831PAKJ?=
	=?us-ascii?Q?f/CSgtAcKf7cahtNq7qRtO/4ykD5iLQvGCGEvKos3bBtjiqwB30c4+wjXiL4?=
	=?us-ascii?Q?yjMIhTDubFBjKl8cUHdchcxhFLw5N0ScDkdS5Z3xhCJ0UUoWJO48L2YY+SNl?=
	=?us-ascii?Q?ipq+TmLvC16Ej/ArGSiDJWsfdbprgRQe3Wzcd0WFRSvIxGWUGj0phFLOcSX7?=
	=?us-ascii?Q?YlZZJr7eknu4iscqBhriDFy+ue197M1moIR/sqN0Qt4A1iXPxVV0gv31bzjx?=
	=?us-ascii?Q?EFn97CrrZQbBXwQq+Vgg5BbFQEoe4lqKwVt0sLo61WFsNYMgf7Ysexz2lJR+?=
	=?us-ascii?Q?/eAGcmgk3QAUjKvPQrLd6AWcqv60HL0vV4UkA7s7ZkoIb/tc/eQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	6:6CopGOunB2u9s4SogEcwO52CzfAQSeRuVLTdKp1x?=
	=?us-ascii?Q?e9i71rS0MvQAKu/lKJ9j6WRZFt1h+gh64LWSuhoUZbE203FJGVlJrfTVOrLb?=
	=?us-ascii?Q?q74tlXC1SPUk4nM+1jkembkimBCisyPNIIKDEaEFkI8Kk9JswC81y2DvTMuC?=
	=?us-ascii?Q?IvVfOBvy91mP5HnQ3eM/tUpOHL8KReFVK6HJ5O0GP8FbVwwQpB3FW/U2EFf7?=
	=?us-ascii?Q?wJH/PDFom2aEKYAXshKqXDbFshcmu3iMsjFstomVLJCLoPjJ2Z6Dybq2anRU?=
	=?us-ascii?Q?HRH3+KOHpNxWvkNObbboxz48RTVPiPBzOdJfMJGrr0WKQL3rTpCyWuoVLG6f?=
	=?us-ascii?Q?sp3kddyT3RYKJpX5sQN3LUpX+NbUiDBtYgjnBSGgLVFLUiDz7y/fo7qkplXv?=
	=?us-ascii?Q?4ALi6RWCKf6u/KO1NckDaQPj/BXcHsotgsNKI36y+1dFz1bY9RkJqk95hgH+?=
	=?us-ascii?Q?aF9K0RLUYuA4mcSD0RJ7OZ+dLBuQJnYgWhwVVHLzO98QeJbJkYpcoNdDRm04?=
	=?us-ascii?Q?eUPQZok69N+CcUrasWFKbInJhXENoSluwy3qiNPTRjfFljiZoY4rF5HU1SdO?=
	=?us-ascii?Q?4r+3nzo89tbpgGZMQM0AaPx5aeIrdLHuIRy7ZKavgya4PqYa2P8WiP0zsCj8?=
	=?us-ascii?Q?sllG+ZRhtSmAdCvz9GNXXbBe2o4A6pHfPcO/lZMNNLhFj/XdOosDuov/6FT6?=
	=?us-ascii?Q?/BUgWVol81UKCSx8hfJGNsFjWcug8png+/Cv4v4PPAxmGywka/r8KDBLROCy?=
	=?us-ascii?Q?EP3g8t53kLc3GBwWV7SQiy5VDIjNeUl6vA7dhraga3Aoz4xjWWp/Fbxl4m9N?=
	=?us-ascii?Q?CUz/E/iwU0S78ao8+EVw41gfIvIYIkJMTLEPlD0GVpr/GIG7D8BfLAPN7U0z?=
	=?us-ascii?Q?kxWn4yP8qpLJl3yJQZAjNe2rB/M5UQFn3zuwGpRrtordR7bZRA+HKY/iKcUu?=
	=?us-ascii?Q?xPU+eGw1xhULu6ozqjz1y5ee00h8DvawN5ODa+yaqLI4aHRmX4yN0VL83joa?=
	=?us-ascii?Q?yK4=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	5:4JOu0t/fIsyxrmlPugNVuyqGgi/WGb+dmFsy7o+/kpGri21zHZszp7krVdRLtJ8hMB+ax1w4AQjHco0pdfB4t4G3O6hagZpRxN+mA2TUXDhICjsUbEA46TneeZb7q9snHcxeYxi/3v51eSEko53SeF88IZAt4flgFpz5wtlopKUzu2hvKATtNyT3YR1HOijYG2TobftqBtoRsqoesqkg13L5GdMTP639Lc502sqCQ3OFr/2JEaQjxvN/pY7iJb9oUF8/kxfA4fx5Ft3bt7W39FMiU2sJ6sE5j1046krZlZsLwW/kGPL9WtjM8dD4ko+jZ7nVhVLT6fGhoHaBnaBBUY37MOhLtEZvKPVQc+CyAfFL8SiiA2VF94nhxR/r5cz7VpDId6WgKY/hEkdk2JidXhRDyhJCUfCfgZNsyapjBznCd7cCmeSxrzB8B6Q0BUytudbtH3CUcowFQSwF41i04BNxCADOxqk71q5i+Q2ws6RmoeWNuC2h5TplyVb7fIC4;
	24:UM5+H//kBWfTYb6PegLC8rcESfel1XISYCkAJmEzLINI2i/PBGziiyGcerdvnHzLtlmQpnJ8qSwKA141QlPDzrupTtJbSP5plcROw285Fuo=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	7:AS/Jps5svkSxJvvWhq5HCe57G2ZYOFW3JUdHtA8lVUTw+gEdRfbdR/sJ//4+LrSKGkYmX8QD5Q9X+lms/sNAPTEKmnLvajfmWyLR3BteSHRNKlXBjRQ1OA+ySdrwzw8rE6zgN0i/k40Z4Dy2jCjAhze8C8Sxk/fJPWuF7GR/KYP6OenbxG+0MqS2GxCUnIsajESUPjKIIuu6Km4ZaIKqwzXRHMTtYmgMr3s8a6yOK6PgW7luKIYnppl4rIFk4Ww9E/jvSKS5vBOD1Z47TdMj8rMm4J2TdwgiRJZbK4qy2N92wSBwNRq4LpRdydYNy1bOcTrf1qkSMA+bwzhRxWxD8nSXi4PXyqK5k2LITpEVBRp9Dzgfi7JYMybKHYz/VLI4A1TEpL0q7qj5D2+qmAL6y1wkomUN1zfRRRqEfpUExkrAlCIbhP58WkeyBDf/yX2oXOXcWHEjAlmKWMF0L/8YPbv5j8iT2COtEYae+eRIgI2PgO8Ah3VS+dQrhv9pMk3Xr7iEPrFCckUFK26jSoPB11kpZu0qyg7vB+N3U+/illGEOq6mJlf5iKIHXdARrfObUUYUgPgsK+Cql6Uhj8zwsK8sS6VgEqqtT0ZtPW9cHT3djyb6H/e/Ln/m8dPE8U0WkND5gaMsoi2igGIKJ7GHmjgdXHTzhLGV096R1PwwHdjcNlyuLJXF3RNRyNqdtDE3qWNgSXGOO/r0wAwfjvSMqa+Yjw94mpVsJG1JKLslEN4GHdPtlFlppkE4buzL+5c1dGXxhF/2C20PVHpNnOxrAKsFbVwu/CVGFDQHEQ4tlrw=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2017 22:49:07.0941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2935
Cc: Darren Hart <dvhart@vmware.com>
Subject: [meta-oe][PATCH v2] 14/17] open-vm-tools: scope build to only x86
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
X-List-Received-Date: Fri, 23 Jun 2017 23:04:26 -0000
Content-Type: text/plain

Since open-vm-tools builds only on x86, set COMPATIBLE_HOST to reflect
this.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
index 7d024f260..906eaba64 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
@@ -34,6 +34,9 @@ S = "${WORKDIR}/git/open-vm-tools"
 DEPENDS = "glib-2.0 glib-2.0-native util-linux libdnet procps"
 RDEPENDS_${PN} = "util-linux libdnet"
 
+# open-vm-tools is supported only on x86.
+COMPATIBLE_HOST = '(x86_64.*|i.86.*)-linux'
+
 inherit autotools pkgconfig systemd
 
 SYSTEMD_SERVICE_${PN} = "vmtoolsd.service"
-- 
2.11.0


