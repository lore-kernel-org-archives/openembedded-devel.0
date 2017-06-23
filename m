Return-Path: <mkelly@xevo.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0075.outbound.protection.outlook.com
	[104.47.37.75])
	by mail.openembedded.org (Postfix) with ESMTP id 07C4678220
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 22:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=BCPpnyklcbJMu9gWgz5lSe+BgKgbtPoY0KEWgolF10s=;
	b=QDPZijNNZsDn9S0Z3QvbuwvjgPS8GWHvxj/01KRRo23PoVXG1ly9cl1aj3t3N+++0iM/IIv/sXw7pC3OVeO1jJvW5VO1/Ab37pdayz88FsM3eynpiahPEsgQWvz1r4yhGZBRRE1HoZpuZckW02OF1HYrn7e3ai+0oIx8h9T/OIs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from columbia.surround.io (65.122.179.226) by
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1199.15; Fri, 23 Jun 2017 22:49:08 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Jun 2017 15:48:47 -0700
Message-Id: <ea4f6d21335c02aa33f7ce4ee751e24b33099a62.1498257745.git.mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1498257745.git.mkelly@xevo.com>
References: <cover.1498257745.git.mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: CY4PR08CA0055.namprd08.prod.outlook.com (10.171.251.148) To
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fd40fc4-6294-4fd6-7ee9-08d4ba8a0eed
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500074)(300135000095)(300000501074)(300135300095)(300000502074)(300135100095)(22001)(300000503074)(300135400095)(201703131423075)(201703031133081)(300000504074)(300135200095)(300000505074)(300135600095)(300000506060)(300135500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	3:NqIlAoMYzyVMcolWaormI486Ng2MAqwJP+cjjp0CRFlI7Fzwh6h+98ymTizgOzm11MKtRO61W6ma22ZMkjQVgu/3OBYscrfeI3j6QX6hts+Edr1tipMxSCfT2SipPBd6C7WVR+E7R8aUMBaAsQQVv7oZ043RS9tQb1p9KftMJ/kVWRvx6IPYUDu0JvJYQuHT55is6BhO1YU+7WSW0v1MWmL7Q6aLXXzO8cuXu7w+ZiFDNy88RnZOsEF8wv87YqK4tcrKaC9Jax8NPVtkRMMRM/0/7urb6ukoMJUmoRa5t0oQ0OnCp7XYSYJywNn/ZT6QGgFYSjj+53ZwaIGxTOrfszE007UUlvamSxyElwV6rxC55bA6ELjZF6ntEuT+9xp/Z//AaMft0IrR/+PI+Z+nCqE6y+BGjVrJsnbKK7ZqI2/whwoD/6ZGpbjlZ6EcrtwNkqsNUcTnve1fwXXdqB4xGYe191R13JS8PA9U2xvr73wqTqDvgz3EQb747WtkPX+S8I2FCCAWKosGp3HkMwSvmdTlTZsZIop08bVzutdauoBkZrxlUEVmG8SgMWMw7VQaPBDLP2AbIHhJZg5pjo8Pi/Sntz6iPPUgq/Gqi8ftFG/7MyQVLYziqzhZLFWny6tK2nQe1L3tf7R+jOO8zAan6fefpxHisVSur5RlxtLyuwVXtogsRQLMTxgVyRDp7hSS8KJNyfI44oCA06Z8qqMIy1YN/KhCpAu4hZhpphPLl6M=
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2935:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	25:Rl6xxWx+SL5jrC1DarUPqP6D2eWtD9f6tTVn4TtF42uee151EY7weiZxLAEq4r578d0MOeOUfPJd0FGY3psfHmT6V7Jst3Z1fHgNGFmvJzwhGzm29lHnMpVGpklRckY0v9PuO/5Cnzjo4kUUG5HFyDFCpRBcHm6vJRTp/sp9aH00f9lljCuFXOVfmpl2CHwykJjLZvi+UvA06RNSs2LTNaZLiNdoVKew+QE0DnJ6QohanrXJdz+6OR0O5If79ioI/68MFh5Eab4s/UEXJtZfv54C/N8x2imkx2LS0+w6G9qPsiseO23pq5ielcjhNzN1aqkidBYE1LRCB29ZxbqT2+4O+JhvB3txUgMGNTs8ajKtsrCZLM1rqSZcUJXiJpRGJC2Z/CWhJv6jp+8GVD5cQrOE8/yz0MbWOO4U0jeSs2gFrELZ8SBYeczh17CcvMkO+Bk8lKkt3ENhyGH0B5wWTj4xa1UFDTENprYXuDPo7Y12o9kgQhGwTH9va+5dr4XvnOjp2oV+LlJVJEfnmoWVeM4VejyJWUsWaZ3kml3R7EbdmZve+v131lEYkM5lhhCWRCT8iKAF3Q0Rk1uuyEUeHs1KaURhdDvVXhtvP22VQRGDtT/m4hQ8+cH7nAGRtp6VVn73jB+8m80o49j3T5ypwqplcnuwKuyXd17p6ynIwrPS22SoYW7+SKVnoBLCvfEdPkpxVNhH4vCBqO7P+4AcdLDbiiNqOdjguY+7yNcwqGPvY2DIYlMY9Xd9wXej8ft1ie5/nJvUi3v9IEcseS/rG2lvBZn6iDhp14TcLg//530wsX7cVgG96sO5QwRpcMgQKF8U8GDj+S5Sq8IDrq1GxsKNrGbzz+9f94JqVEtz10AZD732atKI+IJKCGYuGuickKjRo2bfrqNnTFZR5x0XOijlrqk4fW1PfE0qp6z+Z6U=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	31:6QbFbC/CNutI+FMl/Wq1NJnNXpCU7eCdGtpJP5gmYAlaXZ+eacFiBW7D8LUNl4P02jimzX1YKzcSmjGmr67squzsWDLBN9xjmwn3j/pNLkq6bBlGdH6J8v4vFDZgeJqEnryBHWClIGUlg0jRrhMQUr2WrNxNjdOWWP0OfNi59dAnoeM8E5HvGmk7KDxpRf8TAaL1Yr7QdytMiaoSc59YzPOcKuuqubHOXjBEQul1ZJzPANjMWNhukb76VRWNnSx2s+hW4PxNmebaVeprgOfd20EAa3U+5nqXXhmUq04ohdXS/3H644ZEHxIKQTWkcIIl66r+Ux7M3XW9ZmQF9nvfwPHH7Y01FZ1Ul+oGFiNF3V9Wc3DRRyaBqw6Khafy/Iq4t0jCbw9UYhRy3njuYePlpCgchKn4VvWOqV39uUCHUG8igWzf3PaRaYK8rODWP6er4AeokODLlv7KqIZNgoDy/eowuyyPLIRFNA08CkUJ+ZqZpRq7oco5R8m1Jw2S1LLwss1f130833LooMywwedggGToB47L5plPmg726ZvYYSiL3Ok7ofMhtcD2nl2I6aZgifL4T9sd1I7yUo6X5TTgr84tYqViZjOdwmOatLTYHvKq/xUNawe2r03YPl/msnJT7pUzVVuBbox6mlrcWqNcSTP45d7SrMpqz3dMHulnytw=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	20:BO7W/D1uqM5Fa/4xd4r4HD+V3D4VTgpTd4E40HYlOi/wvZ+CTRMB4JnllugiJ6ScObMy4FChe70h/MUoQN5ULuQohYlUZkIeuvBhYAI/dMnnU7Gzo4e28beH/NhOQLEoNM9rRPM1lbAqG5i6ywTsRKoephQJVN83MtQWgTsvgQAbgK0hZEGyPrqaY5QSbm1kve2gruT5AxvoYyZacmY3QMl05CxVYgy/5ce4PeHLYZhSkkgIAkBAA4JIQsCZ/iCrOJXUH3IlQnJAceuiWrFj/uPBVoWDjVYF6OUt134wA8El7LLSjWBevhaNg4gftENs7oXCOdoqDozoet0NWacnhw==
X-Microsoft-Antispam-PRVS: <CY4PR0101MB293517B2149C8DE617E61871ABD80@CY4PR0101MB2935.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(100000703101)(100105400095)(93006095)(93001095)(10201501046)(6041248)(20161123560025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123564025)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR0101MB2935; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	4:PBktdTt0MR6Q4Ei5BicaD6ZMIjL6NHMGkg1yO9yj?=
	=?us-ascii?Q?OnL+UVODuOq10VrLAtqM+0L9lVe5ZIjnOze53AzJa1fx7SXg3R+0jbIeif7W?=
	=?us-ascii?Q?F09rysfkeLDR227eIyXhEAXYOAAy7FDHobskaOYU4IeawtetXR2rRqDeva6D?=
	=?us-ascii?Q?FcU1b6LCNnoRmdNqvNt6yYwPp4JJJztPicQr7vzuYX3WU/r3sT5P4bhUznpx?=
	=?us-ascii?Q?xcf9hXx7AzhhZWiSa5RivGu4hyHp/NH7i7lX9pTdBJU27bdOlYY2wU74NGji?=
	=?us-ascii?Q?wOEzRotBEEZeplytsskT4qsbLJ9DzSDMSXQKJVNwjSul865e/x5X002dU5cK?=
	=?us-ascii?Q?AIfVMTz9pz38fSJoMfEh46U/m4LRl7QWYBWTzwIBwRcCnt/D8WfYbw7jnl1Q?=
	=?us-ascii?Q?vbnnS7Aqkx11b89bHtNeZZRDn5scwnheQzkj1QeEC/vPKEWgvFSjxUmoqDWZ?=
	=?us-ascii?Q?EjvyJlZvsR6nu5crcKkjtvH2yY/Zjk/BOei1ie8xrGHMZtdNIS+OI+YimvpR?=
	=?us-ascii?Q?+g4wja+rRbEo0nrdzoZ4qoU4iQP+vqacIMGIZwFrLfhXn0NUqKhZdX4U9LR1?=
	=?us-ascii?Q?RpxvbS7OTwLnwZ0AqYPJvTiGChpQB5VPkac5VBR5AnqEX70O3ZgSKJlUFH/f?=
	=?us-ascii?Q?/jmCEwUOE7sDFuj1/VJ3OCNDeM/AW6rZGSkZm3GV1aKsrW7moxo6guu0QRVN?=
	=?us-ascii?Q?Etvty3qD5ULj2+Nv5Y0HPeVEX1/Y0K5U4fjPPFknY7eVuinfrFmJTbfyjVLg?=
	=?us-ascii?Q?kMgH10riC7Z+K2iclhBi2f9nf5lIOT3/RRP/BRMnAVV/4dpg2fHGh6VSbM/O?=
	=?us-ascii?Q?dBziVINRy60QIuPvLwI9aHNWCWzgDE4wJ8MmzSYcaMg8YWB6I2YW4fExkUlG?=
	=?us-ascii?Q?NQYIKkJoQkN4s54/cR68hbjxGyJWQNJ8y21Rikwpe1Us81ss4u96jj4w/LHX?=
	=?us-ascii?Q?Fh2xsBGVJMLA2HYfdQjptBd/JSGlFmF1u8hXvjrXFq2Bo5QF7O1B6FMVGRlb?=
	=?us-ascii?Q?akCddSywm6SsZ33jcLvXvVwHUY1kT3cUqRl6/TMQMIpVsEL5OkS49/3sXaqk?=
	=?us-ascii?Q?jb4i2cmkHo9nKD75VcRVml05KvEAckFxyngJBJVVpcsB1D0Uo/7wmLoiJy4a?=
	=?us-ascii?Q?7YRATr9DaX3u/hRJFrEwjmILT28+vQiI?=
X-Forefront-PRVS: 0347410860
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(39450400003)(39410400002)(39830400002)(39400400002)(5660300001)(50986999)(53936002)(33646002)(5003940100001)(76176999)(8676002)(478600001)(50226002)(42186005)(47776003)(53416004)(66066001)(6666003)(2950100002)(118296001)(6506006)(6916009)(86362001)(50466002)(189998001)(81166006)(48376002)(36756003)(4326008)(6116002)(54906002)(3846002)(25786009)(2906002)(230783001)(110136004)(6512007)(107886003)(6486002)(305945005)(38730400002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2935;
	H:columbia.surround.io; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	23:H4RsgFXp61Kp17gjMLm6rb79a5A31stU393cXBo?=
	=?us-ascii?Q?COezEc1pG27NiqIvqq1rfi3qd1ajOZlcxwkBq5T578OHJRfqSWaXQrLdmIIm?=
	=?us-ascii?Q?Fg9SWTVHWwqZ6No6Gv0zp/LhVnzj41ZXXBxIXjDScvmtKARpAs+Gqzku2zVw?=
	=?us-ascii?Q?anANIGy3K2VOlsW9HjXYmUEAo/FuV3D4yoxuZeFYBEJk47J2w+a6rxZj/sbr?=
	=?us-ascii?Q?tzTq5Ellvz34/ioQ0KfGb/d+nOqco+9f1PY5SHblGVZvwsR34+wGa58jCuUg?=
	=?us-ascii?Q?8B5GIhqSCk6W3M+f1e9kXHDT7z6TBp/fNbWtBPvp0WWdDXyrSpJLHQ6oQksb?=
	=?us-ascii?Q?8CokNYgmIfKkxxOOm5hN+oj4KM1Qum/OD6DS3yv1+uQIiaah/4XyYUyKELun?=
	=?us-ascii?Q?hgJaErhRWPo5SBhMhXI0pnSkTVC3szfrj6p72JlqsrddsDToFW+fz6Vono5/?=
	=?us-ascii?Q?ACM85fwiFoSea5D+JYnNzc3V55QSfCMNbNEm9t0DWHfLp9ireoAk7xWyPuIu?=
	=?us-ascii?Q?NivDfaCO7HuPb6ydfdU/axIsRuuKHcHY0vN9/GpvAcRJpPXtkrCEvEXBruAE?=
	=?us-ascii?Q?CujOxWgk3Olcfcsh9yrMNHgxKoT7oAvG0E9yIGTpr+cEZ+dqmcqIIC1DyXsa?=
	=?us-ascii?Q?m7jk+MWpK3b5yh+4RsejMo/VgE+xC5gy8WcDaI6hBkiRJDvxXaa7VoO/Aoba?=
	=?us-ascii?Q?Je0y0TkEGymL2DaOU8Rf3arzkF6B0UUko4Ub7IG+2+2q79o+58cUhng2e0jC?=
	=?us-ascii?Q?qg7oBb4URhEhjdkZWAifIKR7uNoU/khpPd6cqKsJ7JWuD712x50y8yGB5mGp?=
	=?us-ascii?Q?9wvfpZ7EvLRIJzrn2fHNWawM9F+UVVDiywyfJEAgcXXeDkWx3aFoj0YQNzeX?=
	=?us-ascii?Q?5bZfxWeMp1JG8OpDORw7NLfFCPwVdSCgKg6gfxJVDPabOs6L5DWBmcV9/dND?=
	=?us-ascii?Q?Voak/TlL9H8glMweOzvae/J8J0dyRkDxHr2fNSH8pS6slcmW5s8jB9/UO+ta?=
	=?us-ascii?Q?BpbXFrt3c20QpyfmV5yiz18x3QcFLJx9nGlo3z1/8lIakpXG0zr4MyfvMemd?=
	=?us-ascii?Q?obKhLZkbwnsm17Rtmouwr1wyhvf+gpoqCKEv+ntJ/eEFE7TYPmQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	6:kltH5ZyUwACIfyit8rpeKXv57n/HSXvOir+M59LU?=
	=?us-ascii?Q?ddEBYtSaNl6kruvgbqLlNhPhSuAUW2bYuuNtmA7mEh5uU5g1o0mO9QD6BHLK?=
	=?us-ascii?Q?l4gK6wy/lskl4GjwJYjB0c//p1elzwEdzshDETfU3bik0qByjixGS5DaCI5e?=
	=?us-ascii?Q?8EEOaLAHGEVAIquYFN1oCW2Z+Y59KrTJMvhg6rh1Qt9ic6L5zX20jpYmJIMs?=
	=?us-ascii?Q?G03pJGkqw5Er85JfRfJVJ8zadL+CPecqMqIIXF1T6L3jwRo22WSnkevriO2Z?=
	=?us-ascii?Q?dCs2ziD9OUbiW+WPlq+fZ3RApp8kGh6J+9UfW69FmI4lGy2SYCar6pnz0PH6?=
	=?us-ascii?Q?Npei1hucBEpzYC+MYfIavrsgJOh8CvyT//+Y4tP3A7PGLsoOhx1r5zbj24tN?=
	=?us-ascii?Q?eb8NpJHovqHXxG5JqlN5WL/c2qDzYwuokz67qOlQHFk/PgnMyrWBSO0IHZJQ?=
	=?us-ascii?Q?UausV3gKGsKMQ+MYCLIKoaUFFYjkYpLYTzlOpQ/QzC/fXx3lBKw3oVNf1QmR?=
	=?us-ascii?Q?Oh1C6IGYzil4/mTp70AACxexNzLWlb3QN9JFhJ/lxVb7oTh3v4Ke0S+7/F6d?=
	=?us-ascii?Q?o9xJzMHvDNVpSsg7+/8W7tBBHJkxD4GP9aUHsaaV63hYiCf/8L7nDlPEJfn+?=
	=?us-ascii?Q?9XBZkAWXssi4fYyhDhLgadyEHRp5M7qApclDp5g5+l7gsDa9Q1YUg4WkJhHV?=
	=?us-ascii?Q?JmUkGgzB50k9mFv57wvzusCjvfdNY7/SRKTYuAbe1EXQ/hOtKaeIDzZTDg1u?=
	=?us-ascii?Q?3tzRvU/xoxvBmg3s85hySXPM/LzjSVk/x/5J9I9uSS9zPjG3OrtmH8+dAB8x?=
	=?us-ascii?Q?fq5eTp9A/LwpEbYWWrZj4UdqKflUVs4KK92O9fk/gWiipwjjnsjryIgqlpQf?=
	=?us-ascii?Q?05NMcQNWE35Cdx/gU1H1+ylkLB3bIpRcxcfct4sOeKN7x9avWhKyPN3Y0DMx?=
	=?us-ascii?Q?qoji3fIo202CUmsShaSr6+3FiCP4mB5ET6P9E27kSTSOPOcmNkW3yFzPqQ2B?=
	=?us-ascii?Q?spY=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	5:+FRw0A5uTdePWHGgPGcckDeOPsE++ms1VThDDp7eRHYeo/ItS9sbw9adcllG7bs3f0RGB/YRAf1RmIHtp0NnHgHPyScbRvbz7aDCos4MV83uvNItRsuV4f/CdAo/KYMxoqRxLOvbtrL4u2O98/xHwowGH2RY5XPICCoZxli9g0C6up7uZaHceV66unm9PhTEdKpqzOGwr6beHS9cTdMdyuX8wFKPy0HDf9jAXGCTkhMhsJQHD3BlX74OcYbF8JaqfjV9S9R09P9pUqJ2bVP+vLbQzVuJzaGfRuc7exBiztdoFm+sEsVmMr5bUqvGsbEAEcituH1AsR8FvZMi2rAFUJl9TjXbFomGeFrB9o/ktw/LEojQv72Vo8Qb4bQBloBiVkcFmQl5oZCJhp6WrwPbFXNMIEdqxeaFMU+E6tT1ewPmF8dlG5rdrxcJp+Sb1t9CaT5Mvp5jnLN6vKWjxLdxh7x3iH43IoosM+oGrNRairWU84K1piM6goGMv9FSczDx;
	24:hDU1iXNrfHQDoqNn91hRTvZCG0UU+Yi+WConFfwrDzzGS/fsAVUNPB1P4T3LOT/76VwqsImEdWO31otm0y+DjTGQhm9tSL7pJyWpjhlStYQ=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	7:vhdB/OcAokPpYCqegJ9CTrLmvW1c9Cbnw+814zqQIxNJdAxPB2ObofSpUjrAVxqehztZUr1/j84kUdcxwUwYSf1SAcCfOyM0cuqksjwwHJO+7lcDV/b5MgZ2ocXUSwbZteJBKQLIeFrARswrMXovkkHstgQfVkWUfnKkbKzDsHZ+RmBOag/5KgJ4pRDlBKzgU4awvMW5ORe0DGG9Z/R7XnXQFPTjB/L3FXq0F9Br92r2UqiEEZERD9u+zBSn60eNHKad9qutklX7SVtTrBVMVp3ZNA/qAFI81bnZWhIVp4qWHZ6lHy2+0pjiagF3ZvcHVVOcSsCm6nTqvX8ZtoCCu/N4Z4OCYQzbLKL+nK38YoEoVDTRtYf+BxnBwrgXaoP7TXVEQ4hKH44d1JxEdaIdTDTZfFPWyJeCalNJ6GClps04UDXdaw97FDHh/23yY9uyXv1WBEwbHXFe0NvrRJsPOITT8/RGz7305Er6puFlGg2OLEhmeX/dzEZCaCFOELuUWFe5q+qUK1bSBxF0IfFb44mwlPoHQM987j1JHTEz46216OUJFjLDfm6YVsyKJ3uLgmrq8Df8PME+aMdCU+gZBopy6N1W2yRgZCgz9iKzssuYIlLARPl5wzRdFMStjpK3iP9A4jI7v/TlZF4SsekQxw9hr0itPjDhi2LeYG4TfulPWMcQQ2aZiYqU9sufuXMiL4IqtnmLDEnL+JRPCfXCvgmRKHRk0Jm3N0csNnFFi4Oai/X9jM3n4au5P6U3/nVdabV3aNlTbOCS6X/NdckVl5PuSKIditwCAn93aoPmmJI=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2017 22:49:08.2970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2935
Cc: Darren Hart <dvhart@vmware.com>
Subject: [meta-oe][PATCH v2] 16/17] open-vm-tools: fix all hardcoded paths
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
X-List-Received-Date: Fri, 23 Jun 2017 22:49:08 -0000
Content-Type: text/plain

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 .../recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb  | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
index 4ab2820c1..2a83e864f 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
@@ -56,15 +56,15 @@ PACKAGECONFIG[fuse] = ",,fuse"
 CFLAGS += "-Wno-error=deprecated-declarations"
 
 FILES_${PN} += "\
-    /usr/lib/open-vm-tools/plugins/vmsvc/lib*.so \
-    /usr/lib/open-vm-tools/plugins/common/lib*.so \
+    ${libdir}/open-vm-tools/plugins/vmsvc/lib*.so \
+    ${libdir}/open-vm-tools/plugins/common/lib*.so \
     ${sysconfdir}/vmware-tools/tools.conf \
     "
-FILES_${PN}-locale += "/usr/share/open-vm-tools/messages"
-FILES_${PN}-dev += "/usr/lib/open-vm-tools/plugins/common/lib*.la"
+FILES_${PN}-locale += "${datadir}/open-vm-tools/messages"
+FILES_${PN}-dev += "${libdir}/open-vm-tools/plugins/common/lib*.la"
 FILES_${PN}-dbg += "\
-    /usr/lib/open-vm-tools/plugins/common/.debug \
-    /usr/lib/open-vm-tools/plugins/vmsvc/.debug \
+    ${libdir}/open-vm-tools/plugins/common/.debug \
+    ${libdir}/open-vm-tools/plugins/vmsvc/.debug \
     "
 
 CONFFILES_${PN} += "${sysconfdir}/vmware-tools/tools.conf"
@@ -72,7 +72,7 @@ CONFFILES_${PN} += "${sysconfdir}/vmware-tools/tools.conf"
 RDEPENDS_${PN} = "util-linux libdnet fuse"
 
 do_install_append() {
-    ln -sf /usr/sbin/mount.vmhgfs ${D}/sbin/mount.vmhgfs
+    ln -sf ${sbindir}/mount.vmhgfs ${D}/sbin/mount.vmhgfs
     install -d ${D}${systemd_unitdir}/system ${D}${sysconfdir}/vmware-tools
     install -m 644 ${WORKDIR}/*.service ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/tools.conf ${D}${sysconfdir}/vmware-tools/tools.conf
-- 
2.11.0


